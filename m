Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0C3264D9;
	Mon, 25 May 2026 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721884; cv=none; b=ZJ9CGbJTxKvNvtoitq9ifJc+uVwiyltG3MAzwI9khkweepAVlBU1lUSEVw7JvLs8KW4nIc50h3y2V+UNLUsoh0wBTPLk1J4YVYY2K/eYEBumwsTx2AoiMpwGriWAziML4Aq5fuKVwAge9696SgJrSQk9jp8xVufBCTji5j4RfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721884; c=relaxed/simple;
	bh=oqwMY+gGkuzG7E7C9qevj3NifMvn65XfptocozRheTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkW8d8JIv0RYtGCNTMdbSwEUQHNQNWvlhWfeEDlbXWQTogk1IexgXU3Msb6fz9MOM9N+B0RYhzWfDcYH0g5X6sz7dOJUy3+c87BG3B3FptkNsrJ/AjCegrAdt2zi82U4NmJ2R3Q02GVB9wYrPoMuRV6MDHquYUtkii0TRffUHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=lKKRsyIl; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="lKKRsyIl"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:f12d:c647:56ab:8d5d])
	(Authenticated sender: vjardin@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id A4C2560141;
	Mon, 25 May 2026 17:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779721873;
	bh=oqwMY+gGkuzG7E7C9qevj3NifMvn65XfptocozRheTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKKRsyIl0ndNslUvlIci+tVKKbIoXw68WOKQTGpyYSMOEM+fgvRo+h1mmsG7txsgM
	 sy/3/FuAV5//f0qdmG+T0Krc8y3K2Fn2RsfSpK9gnAse6/9TWKYVCM42FgXozlWwMa
	 Dr+NrpoqXork0swxGkaGGKgg1HBYFSRUQR3TLi9THVC901NNOJGeH7G3efcqtdpo+p
	 uK+/xnjEYwS3pm+FCbTNWh6QNIzBLADISg+m6+VsJNzZonHCggaFiqehJRhkehg4VH
	 emJPZVLVEFt/FhPxiNALfr1mdz9PgosmFJ9CG7JlDyCp2XAs87xN+rL0l9ZHIgsmjE
	 w0tHGqvSwllVQ==
Date: Mon, 25 May 2026 17:11:10 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
Message-ID: <ahRmjr9cxYmkYvm5@L30177.local>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-1-f30ab53dd97c@free.fr>
 <20260525120404.BAF831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525120404.BAF831F000E9@smtp.kernel.org>

Hi bot,

Le 25/05/26 12:04, sashiko-bot@kernel.org a écrit :
> [Severity: High]
> This is a pre-existing issue, but does i2c_imx_prepare_read() incorrectly
> NACK the length byte for atomic SMBus block reads without PEC?
> 
> When i2c_imx_prepare_read() is called earlier in this function to clear the
> I2CR_TXAK flag and ACK the initial bytes, it uses a check for (msgs->len - 1).
> For SMBus block reads (I2C_M_RECV_LEN), the initial msgs->len provided by the
> I2C core is 1.
> 
> This causes msgs->len - 1 to evaluate to 0, which leaves TXAK set to 1. The
> controller then NACKs the very first length byte, causing the target to abort
> the transfer and immediately fail atomic SMBus block reads.

You're right that the guard is not consistent with its the comment. The
core hands a block read in with msgs->len == 1 (I2C_M_RECV_LEN;
i2c-core-smbus.c sets "msg[1].len = 1"), so "if (msgs->len - 1)" is false
and TXAK is not cleared, even though the comment right above says it
should be for block reads.

Maybe, a better design would be closer to "if (block_data || msgs->len > 1)". In
practice it is a latent topic only: TXAK is already 0 at that point, which
is why non-zero-count block reads work today. That is confusing.

In fact fixing that guard would not include the block-read-of-0 case because
the two act on different bytes:

  - the guard decides the ACK/NACK of the length byte (byte 0);

  - the count=0 lock/wedge is caused by the byte AFTER it. Reading I2DR to
    obtain the count already clocks in the next byte, so when the count
    is 0 a dummy byte is already in flight and must be NACKed + STOPed
    regardless of how the length byte was acked.

There is also an ordering constraint: we cannot emit STOP before reading
the length byte (we need it to know/learn the count is 0), so once it is read
the prefetch is unavoidably armed and needs the explicit NACK+STOP. So
the length-byte guard is a separate, nice-to-have cleanup.

> >  			len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > -			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX))
> > +			if (len > I2C_SMBUS_BLOCK_MAX)
> >  				return -EPROTO;
> 
> [Severity: High]
> This is a pre-existing issue, but does returning -EPROTO directly here
> abandon an in-flight receive cycle and leave the bus permanently stuck?
> 
> When reading the length byte via imx_i2c_read_reg(..., IMX_I2C_I2DR), the
> hardware automatically initiates the reception of the next byte. If the length
> exceeds I2C_SMBUS_BLOCK_MAX, returning directly without generating a NACK or
> STOP condition abandons the transfer.
> 
> Because the target device remains in the middle of a transmit cycle holding
> SDA low waiting for clock pulses, and atomic polling mode disables sleepable
> GPIO bus recovery functions, does this cause the I2C bus to wedge until a
> power cycle?
> 
> Should the same graceful abort sequence used for len == 0 (NACKing the
> in-flight dummy byte and emitting a STOP) be applied here as well?

Good catch, and yes: it is the same root cause as count=0, once I2DR
has been read, the next byte is armed, so the bare "return -EPROTO" on
the len > I2C_SMBUS_BLOCK_MAX path has the same lock/wedge potential issue.
A v2 will fix both cases (count == 0 and count > I2C_SMBUS_BLOCK_MAX) with
the same NACK (TXAK) + STOP drain before returning, so neither leaves the
bus locked.

thanks,
  Vincent

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr?part=1
