Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D51359A70;
	Mon, 13 Jul 2026 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971600; cv=none; b=T1arNNHS2QTjeyh7cLaXdbfonEzN4dpPUMwu0UHjcFewqn+YgSqvmeobUcgvB7w3dJtdyMIKZv3Aq33rNkNytIqJh9N7bI6j1aLTynq17CZ8lEPzEEX+K5clcBG2ETp3Mjrxd4b5YuoltEP7ePvd2n98iBjE//KTUMY+xO7lmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971600; c=relaxed/simple;
	bh=25GUxTbwYYmfMkF90o6hPSTkcsEY3JRtbo6d7x3juOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPJlE1LTKye4UW5ht1yxLQa4Phe9t3/KIg2LfHDuU2hfmfQZGDzMpN1EIIytjidfKFu84oqCdL4cK1cP/9OMpNu+Icp3e55x+UHdxnWQ6ziSkmoKYwkY2bMF/ouVm8EgslZKFXsT7VziKD+NwE8MKDHit178BypiXmkVG851QhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=dnhcHRvL; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="dnhcHRvL"
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 89451DF8443;
	Mon, 13 Jul 2026 21:39:34 +0200 (CEST)
Received: from l30177.home (unknown [IPv6:2a01:e0a:ac2:22b0:1c85:c04e:9ad4:c6d8])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8BDCD19F54D;
	Mon, 13 Jul 2026 21:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1783971567;
	bh=25GUxTbwYYmfMkF90o6hPSTkcsEY3JRtbo6d7x3juOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnhcHRvLMTyN43whZCL9qDhmrp8Z0aF2KPTdtk8hdRxMkEcgX3w+wQHQ+L6OhOHTi
	 3S8NKbMjTSTZncq6E4wtZCv8WN+LVN2Xp2muxI3NtX1dDRhSBDoPjYdof9+BaO6vTZ
	 N+mVWm/6Q5UvhPPn7lMLa/cldNehQPmH4WBCHHPFlN488U4y5ILPwcv8HqDL7fC/Na
	 uEq9ZDB+O+EgYvKaaquqb7VEdErW14TAcmm1enu6YH2fl0FPxYCMJHwHRXkeR98TFb
	 ZXXhsB7zeDQNz4NPJd7KWkIdUBMWrtueEHea3Br7sofzItCwqEeBo1Cb7HDqRVh4y2
	 ZiPb5SOKHpooQ==
Date: Mon, 13 Jul 2026 21:39:24 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v3 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
Message-ID: <alU-7MXMiRth36Qr@l30177.home>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
 <20260713-for-upstream-i2c-lx2160-fix-v1-v3-1-073ac9e103a5@free.fr>
 <20260713182637.8A9141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713182637.8A9141F000E9@smtp.kernel.org>

Hi Bot,

Le 13/07/26 18:26, sashiko-bot@kernel.org a écrit :
> - [High] `i2c_imx_prepare_read()` fails to clear `I2CR_TXAK` for SMBus block reads, causing the block length byte to be incorrectly NACKed.
> - [High] The interrupt-driven SMBus block read path (`i2c_imx_isr_read_block_data_len`) fails to properly terminate the transaction when receiving an invalid length (0 or > I2C_SMBUS_BLOCK_MAX), leaving the I2C bus stuck.

Both topics were already raised on v1 and v2 and answered. No change with v3,
so no need to reopend those threads.

> [Severity: High]
> This isn't a bug introduced by this patch, but does the interrupt-driven
> SMBus block read path in i2c_imx_isr_read_block_data_len() fail to properly
> terminate the transaction when receiving an invalid length?
 [...}
> I see the commit message acknowledges this flaw exists in the interrupt
> path but defers fixing it to a separate patch. Since that patch is not
> included in this series, the hang remains active in the codebase.

See 2/2 of this serie.

Same for v1: https://lore.kernel.org/all/ahRoKMLtrirbowbj@L30177.local/
and v2: https://lore.kernel.org/all/ahVZPLHymdsZtgg5@L30177.local/

> [Severity: High]
> This is a pre-existing issue, but does i2c_imx_prepare_read() fail to clear
> I2CR_TXAK for SMBus block reads?
> 
> In i2c_imx_prepare_read(), there is no check for I2C_M_RECV_LEN:
> 
> 	if (msgs->len - 1)
> 		temp &= ~I2CR_TXAK;
 [...}
> A compliant SMBus slave will immediately abort the transaction upon receiving
> a nack, causing all subsequent data bytes to read as 0xFF. Should this check
> include the I2C_M_RECV_LEN flag to properly clear TXAK?

Already explained with v1:
  https://lore.kernel.org/all/ahRmjr9cxYmkYvm5@L30177.local/

Best regards,
  Vincent
