Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765558;
	b=HgVFRxzj8pNbAkWxl9xe2ZvEvDM93PROBhnTBBFundweF/JYPe4njUiGNUh+CZddc69h
	 VZzc/sb7xwrVnfGhrnM4+OFJZOwVZTQRlBQ/ViTx3B4rhqyoeIpG5c7y9Ibxnts7DCjwn
	 pAv7SC6q+RzyuFHfhlyXpHoPm++zpDGg8I2uohkygL6nWpJ0PjooZDL97lPEo4yKhcsCB
	 inHa844dInjjkqOnlv4Nnx1LevFN56qgVXm1JNJYfR/2lv2LgsUXU3xTCBi9fvc12PDts
	 rSCBCIuNE+Dz5zkgB8B8bpjQ4mfzMCw/W4QPfYP+5Mr0wOYD0giFi80IkQUAGRhc/Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765558;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=W5fuhNKUSXuRd2FcFbMePX8/tpQy3waUB4xqOMmzouQ=;
	b=LZhokUrbo6o+eTdpSjrh2MXzQHSJYkRzbYph3DZRge67lUduYMlRIynK+POh1nXhlZjx
	 RV6LHiisoQFJ5/Ask/zpI7yKyxm6IYpqWScieoo0FSWSQdlvKA3VYL9dT+PX2JYfmOaXV
	 o7DKV96mxkZ/VSZ4cCRRFKRHhyh1k3udNBJnE84L3KtmIWHxg0yTA5J02j7XibMjru8q7
	 UpeBbcPF/NFf3hqFE+74ZXobf4x0eM92n63eSUloxbNpz+twFgHimycAapAJYew3OVLxV
	 VQsrxBRR/Xos5lwRzilYvB1WBdMdqUbIKh0+rlEDTZI4QqpHQzmF6xNMye3nfRSvrbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=vU0ddTxz;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3E606A321;
	Fri, 23 Oct 2026 14:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF3E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=vU0ddTxz
Received: from L30177.local (unknown [78.240.209.29])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3820413F8A2;
	Fri, 23 Oct 2026 16:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1792765549;
	bh=bGXAgwF2I4uAU6K1JxWgp4tW9fCtqmRSB/yMy7Oshco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vU0ddTxzwSM3utvw0gOR62M9AdP95A6Y1M/avA8OKZiQWVcWK04y1/qlGIaal9MGq
	 /ZwFrHgEFAP9PAi8KT+fi9BQKnmAU/8oMzT5j6JHKtc3drAbCKuR5/XO6T1AcWhZ8Y
	 EgJW19NhbMNPWCFtzPoPH3fy5ip6kqRtOzkZYFjpw60aJJaVazt4a7nBk8snn3+MDM
	 8h99TDHYt8iA6db5n1uxNPCnFClo+HGBhQzJgD7yN1Dmomz+LpaJPiGkfvewFlK96q
	 0kYs55D6VTUB/8Lrd9Nm1NWqfxW7VSnsRkmFTAIBjKTFjA/N9eVAeGbixCWJ/wREKF
	 NXOYiyc9AOyog==
Date: Fri, 23 Oct 2026 16:25:45 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH RESEND v2] i2c: imx: add I2C_M_REV_DIR_ADDR and
 I2C_M_NOSTART
Message-ID: <attuac0-PDBA9X8p@L30177.local>
References: <20261023-for-upstream-i2c-imx-lx2160-reverse-v2-1-03afae754886@free.fr>
 <sashiko-outbox-182524@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-182524@kernel.org>

Hi M. Bot,


> > +}
> 
> [Severity: Medium]
> What happens if a caller splits a read across two messages, passing
> msgs[i - 1] with I2C_M_RD followed by msgs[i] with I2C_M_RD | I2C_M_NOSTART?
> 
> In i2c_imx_check_msgs(), that sequence is accepted as long as i > 0 and
> msgs[i].len > 0. However, the read paths for msgs[i - 1]
> (i2c_imx_setup_read(), i2c_imx_isr_read_continue(), i2c_imx_prepare_read(),
> i2c_imx_atomic_read(), and i2c_imx_dma_read()) unconditionally set I2CR_TXAK
> on the last byte of msgs[i - 1] and set I2CR_MTX before reading the final byte
> from IMX_I2C_I2DR:
> 
> drivers/i2c/busses/i2c-imx.c:i2c_imx_isr_read_continue() {
> 	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
> 		...
> 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> 		temp |= I2CR_MTX;
> 		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> 		next_state = IMX_I2C_STATE_DONE;
> 	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
> 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> 		temp |= I2CR_TXAK;
> 		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> 	}
> }
> 
> Because the controller sends a NACK at the end of msgs[i - 1], the target
> device aborts transmission and releases SDA. When msgs[i] then runs
> i2c_imx_setup_read() (or i2c_imx_prepare_read() in atomic mode), it clears
> I2CR_MTX, performs another dummy read of IMX_I2C_I2DR, and clocks in 0xff for
> the remainder of the transfer.
> 
> Should i2c_imx_check_msgs() reject I2C_M_RD | I2C_M_NOSTART when preceded by
> an I2C_M_RD message (or conversely, when a non-final read message is followed
> by I2C_M_NOSTART), or should the read state machine suppress I2CR_TXAK,
> I2CR_MTX, and the second dummy read across the message boundary?

hmm, ok, updated into the v3

thank you,
