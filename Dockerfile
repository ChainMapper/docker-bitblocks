FROM chainmapper/walletbase-xenial-build as builder

ENV GIT_COIN_URL    https://github.com/BitBlocksProject/BitBlocks.git
ENV GIT_COIN_NAME   bitblocks   

RUN	git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME \
	&& chmod +x share/genbuild.sh \
	&& chmod +x src/leveldb/build_detect_platform \
	&& cd src \
	&& mkdir obj/support \
	&& mkdir obj/crypto \
	&& make -f makefile.unix "USE_UPNP=-" \
	&& cp Bitblocksd /usr/local/bin \
	&& cd / && rm -rf /$GIT_COIN_NAME

FROM chainmapper/walletbase-xenial as runtime

COPY --from=builder /usr/local/bin /usr/local/bin

RUN mkdir /data
ENV HOME /data

#rpc port
EXPOSE 6666

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
RUN chmod 777 /*.sh
CMD /start.sh bitblocks.conf ZCN Bitblocksd