Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235776;
	b=5MlpdKFzMU2AIlTLY36kpmyyFJMnpGomKCeQmnX0Om7Ymu3CDXHyWLs9sZO03kKpg87+
	 hRelbDOYf9x6dlySCU+UBSNi0hDiOAkXHrVVbxFsYgqqG43YEnBDKP+rvH0+KYWWB3ao1
	 se/IfIT/xtq/c6xqOJF3Pjk/6KoNvDzZWoYR/XmKkGmldGNdDsi/gr1Qezn6QZGw5W6Fu
	 7Mwq+SZkFAaGW9+2A1iu+dRns63s5CBY4QRcD4erpTGXgpHEUqoGMLa7I4Ki2TDMY0rwv
	 vqjTaPlsvzWycX0Uvw3YugTa/I5nf7cQbgJuiFTRoFVLeBIjQ6DdLy/+eHY3FkGPdlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
	b=n8RjvXzhXUusKvjsgHinZEQ4mj4AMsfZs7tPHsegyopjyFdB8C6Tt9FOPEue0sa6TQcs
	 24vaRPNz5HonqNDVfb9+3c+03T08VaxxNy4FacWB0ruP9V6bQhqoDSUnEFtk4QLa1fuf2
	 ortn2On+8zJOJNd0qezzPm9gbYw5EsW8ozpc+hqhgoQMyBxtgkDKAv9r8/EjJ4SmVPgpT
	 BUSTvinNguCsr0/gTN7znvJGKh3OVydLSnedUVfmF03zmTWuY2TTWS4Y2tcHJM77hDbmT
	 4tMulm+wQabjcWtl4NE1s9nNxvpHWSS6CvFUwB06gRhrpEvmwhXi/DNw+GloJ8P09aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xYxopkpu;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C45606EE93
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 14:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C45606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xYxopkpu
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so431991a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 06:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794235774; x=1794840574; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=xYxopkpuIameUjYUVvVt9LhE1UhckOliEgpUtSMhFUFtQe9oH40gjAMbqU4BU0HIuq
         3dwoBWqH6AnNPk9CX1QC2imOFtc3QcJ1lPGtbmozCQV9/+OPUUZvayFYt0IY/UJq1PWZ
         GjnCHaXRScnDIpHhLwxvGAxc9sEGT5hV3IgSUrhMPyrWnJadPd1exhF4EJVVEFDAscEV
         ipXIgC1YG+z+XSoXcTHq6TxVcekv2rE9Uc1UASzWMXSY4qRUmflsqlOngHjyTYUKKN9V
         4vGudME1z0n7agRoXdwRl7BPUao9yesCUDUkkaSluldXHGouI2b8lfRPdkFaMCyuDRyZ
         4qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235774; x=1794840574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IrVeQKBGEQiIhXPASB7aO1B/hnuopAlb12g77nEvd+E=;
        b=JXYhOEOyGKZ94C/LpcbpDp2L2OI/I+/QK8xDj3jOIOi+jENFobP8DHQvaTFaYAdpFz
         FUoMVPnqzVaWKNMeTM47DtbaafqjowwEf8QGFz/K67xGd6/QzMfKbTLWZEivZRF/yMeu
         l14KJgOlztPWfXHKlL34f45sW/JBNh/CQyTrsCaaav+4s+34msRUEWtFUpHxIndPi+kx
         hpq8xLiItJ+GwNUB4W2mFpASA8IjJR9QIlyly7U7KNqkQ0NJsWWhAnvu6f+KrM+WbyPY
         w20SaY3P2GodsBeOg3Hq6Q2Wq6fCtsOgDr3MgBF6fkh7UE22cCDF1vGGc3x9qInKUMnb
         MGnQ==
X-Gm-Message-State: APuU4Z/fJF10ZF9OQgkwmugn37BeXZnQizvUI4spvMyQTwGGY6WtM3pc
	5ZPYl8pBrokmG/psCaIVEUTrjR5q10bB5mgcJ6ZZiPr4QGusjeol+Y5WakQJIJQ0ZzU=
X-Gm-Gg: AYBFou0O3WpH3nZxVSF3mAf7Z3zFGE/ZBCfOiA5Krvb+lFct448iJnzCgh/W2ollo4I
	O97bXWogCZA7twJtdP0obih8d5eneQKrXo/zoQxDeo04Rpg2tkyVaNry4l3CiAYGblb1h8lGzsq
	7HVcwLWsqgbsW3GLGJT37/RGvyvHypkW51wgoNji0NthsI1PCh6U9QotBNQVb4Gv62kHvopRLW3
	HRByMyxD837xmehzAZodfuKuPF5OS2Y04yJnWKVbkQlirGDgJR2X3ONQbBrIm73EuT2nulXqrBl
	IN1uNmtZBkD+1PDTpk2IdnGUUf9sFDX+rq09YjpR++tGTnstX/C9EQkFL+li+dp8FtI60AX/79m
	vGGCdXqr3qgnfM/U7yhmoctyS6L2Q54Qg3ieysES/ml3+9Uqf3839ILqYsh39T2u04CZcsL8/z6
	WrjeYXYy7p8mqtcrntBbA0HBasVEyZMDyNvQU3AXVTw7kbF0hoqQoc+dapIS9hliFNiuHgXZxJN
	w0xmjrOJqnOxWXLwVO5qy09w1MsiBcvDwR22opiz4a1HfOFJmgog5hD7Kjwh0MykZLxt+RN99+V
	bsMlmoMtvr0sDd/T8SZ5O+/kwz0r+w==
X-Received: by 2002:a17:90b:384c:b0:3b0:9317:5849 with SMTP id 98e67ed59e1d1-3b12d1080d0mr4128385a91.1.1794235774376;
        Mon, 09 Nov 2026 06:49:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm6647786a91.0.2026.11.09.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:49:33 -0800 (PST)
Date: Mon, 9 Nov 2026 08:49:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <avHde2RgEUtQj846@p14s>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
 <auyGiW91Ir0JcuxG@monoceros>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auyGiW91Ir0JcuxG@monoceros>

On Thu, Nov 05, 2026 at 02:41:37PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 00019b1895e6e..e750a127cbc4a 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> > >   * @detach:	detach from a device, leaving it powered up
> > >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> > >   * @da_to_va:	optional platform hook to perform address translations
> > > + * @memcpy_tova:optional platform hook to copy data into remote memory range
> > >   * @parse_fw:	parse firmware to extract information (e.g. resource table)
> > >   * @handle_rsc:	optional platform hook to handle vendor resources. Should return
> > >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > > @@ -99,6 +100,9 @@ struct rproc_ops {
> > >  	int (*detach)(struct rproc *rproc);
> > >  	void (*kick)(struct rproc *rproc, int vqid);
> > >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
> > > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > > +			   size_t filesz, size_t memsz);
> > 
> > [Severity: Low]
> > This isn't a bug, but is memcpy_tova the best name for this callback in
> > struct rproc_ops?
> > 
> > Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> > ops->da_to_va), da denotes a remote processor device address while va denotes
> > a kernel virtual address. Since rproc_elf_load_segments() passes the
> > untranslated device address da directly to this callback (including for
> > devices where remote memory is not mapped into CPU virtual address space at
> > all), calling it memcpy_tova seems somewhat misleading.
> > 
> > In addition, when rproc->ops->memcpy_tova is provided,
> > rproc_elf_load_segments() skips both the filesz copy and the trailing
> > memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_tova in
> > include/linux/remoteproc.h document that implementations must copy filesz
> > bytes to da and zero-fill the remaining memsz - filesz bytes when
> > memsz > filesz?
> 
> That's a valid concern. Maybe `populate_segment` would be a better name?
> I considered being more verbose in the kdoc entry, but all the other
> entries are very sparse, too, so didn't want to add a 5 line comment for
> the new callback among all the one-liners. But I can if you tell me your
> preferences.
>

I would stick with ->memcpy_tova() to keey the mcmcpy() semantic already
rproc_elf_load_segments().  But yes, go ahead and add the 5 line comment.

 
> Best regards
> Uwe


