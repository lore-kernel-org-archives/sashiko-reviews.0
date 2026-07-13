Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD004499A4;
	Mon, 13 Jul 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972240; cv=none; b=HQO+MwTbjl+2mgj+9yssw/VDNoQUZghGwWVb/eZ6vDkGz2UKvBzusLLqr6DbLSRAojaHtkB+5HqM9kJgvn6YySG5B9tf+SGYc0X1BIK5WQhWlJWQRd2REhyXWCNnLzLvQ1d1HDPJc5sv43up7xRX+1tKCnnD1DxtyNFmp7eSVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972240; c=relaxed/simple;
	bh=48jE9ijxzDFf+4uuAkqonJ4sT7rHFfQTRJVZ1iAP+Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CemEh7SPVLfwdlWML/4skxGJCHu0q1OgjdDsVlmtbkSSe+FOQPDn/LZLiqujzJM8YlNRKAFM8tvholSndNp6Ues5U/a7+d+usrHyxSgA4WZ531IH8eQlSFPpt8iUuod+oCnPHErDBFvFTTI1RaM3qQnGBGouNS7u/kbBZZAOwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=AdNYafhw; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="AdNYafhw"
Received: from l30177.home (unknown [IPv6:2a01:e0a:ac2:22b0:1c85:c04e:9ad4:c6d8])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8E1E319F54D;
	Mon, 13 Jul 2026 21:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1783972236;
	bh=48jE9ijxzDFf+4uuAkqonJ4sT7rHFfQTRJVZ1iAP+Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdNYafhw5qkuM8vFEITkTRMvKF/jbqsoqHZBxUG9WqZN1MUPMykRou6+G6lzqC5Yz
	 asMmWWrDCTg+FQx2n+yfaUoEud/Ls5/MLHj51lZZmPEIaj0VJs5d7mqNBg+bNqjDl7
	 Lrnu/0h9KvzCCUEBMB9fGIHv4Bx3xdpI2P7zltDZTuFxc3/qq2gwMtcoNRbzDkVrND
	 gl5azLN5eVxlKOfT6M3l92BS47h6Q8eMew+JZY6xA3t5AW0ppDonbBv+OBq1R0SMV1
	 6WhEXQd82cB1DgAVi2x9tXLPPxa39PTu11r1kNA30/9QHz8JFPf5n7+EA96U671uDs
	 xZ+HtU8h98K7w==
Date: Mon, 13 Jul 2026 21:50:32 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
Message-ID: <alVBiC-9Gb15UMjT@l30177.home>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
 <20260713-for-upstream-i2c-lx2160-fix-v1-v3-2-073ac9e103a5@free.fr>
 <20260713182912.55D881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713182912.55D881F000E9@smtp.kernel.org>

Hi Bot,

> Pre-existing issues:
> - [High] SMBus block read with a received length of 1 fails to NACK the final data byte in the ISR state machine, potentially causing a bus hang.

You have a point, but it is a pre-existing side issue that is not the focus of this serie.

> [Severity: High]
> This is a pre-existing issue, but does this code properly handle the case where
> the received length is 1?
> 
> When len is 1, the length is updated but we fail to set the I2CR_TXAK bit. Since
> reading I2DR at the start of i2c_imx_isr_read_block_data_len() already initiated
> reception of the final byte, doesn't the master end up ACKing the final byte
> instead of NACKing it?

It seems to be an OK argument.

> 
> If the slave holds SDA low, and we later try to generate a STOP condition in
> i2c_imx_isr_read_continue():
> 
> 	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
> 		if (i2c_imx->is_lastmsg) {
> 			/* ... */
> 			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> 			if (!(temp & I2CR_MSTA))
> 				i2c_imx->stopped =  1;
> 			temp &= ~(I2CR_MSTA | I2CR_MTX);
> 			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> 
> Will the STOP fail and permanently hang the bus because SDA is held low?

it was pre-existing. It is another issue to be checked, but I'd like to avoid
widening the scope of this serie since it was already widely reviewed.

I'll check for another specific patch for this case as a follow up. First, let's
finalize this serie.

Thanks,
  Vincent
