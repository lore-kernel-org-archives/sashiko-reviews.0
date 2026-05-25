Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA53859D2;
	Mon, 25 May 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779722287; cv=none; b=aIwX8FqKf9hfKlwxDb3NW28CDJoDbdnl8KjwGadGk4/fP9xmYjE1qkdvhEf3zNtZ/mDMq8eglhKyMjsZeVQPuizGWhcBiSgCLLr3S5CWBe9381g74gLCoZPXxP0rEEPJkcwCq1pb2bgp+uMvj8Xjs8AdDIKZaof3+jUD+Seq3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779722287; c=relaxed/simple;
	bh=/gsg9VEkmwpYVz19wHXrRUDXZtFVuQIr1WfOaguO164=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlZn+l80iPhVMD3+n8YHAXrjaAr5VWTTZMFEIuczmbqooCffNCpl0LX814FwxxiNLt14ADtDldUlGorBwW2Dlrc3BFC9xFuspd46+WbSocRgSZbLpLr5ePxfEFqucXJqKLQdvy8O/5gQLxGCmcg2k3uC9EeQwTNiBlj9RZ8RJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=NrrDeBdB; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="NrrDeBdB"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:f12d:c647:56ab:8d5d])
	(Authenticated sender: vjardin@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1487360137;
	Mon, 25 May 2026 17:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779722284;
	bh=/gsg9VEkmwpYVz19wHXrRUDXZtFVuQIr1WfOaguO164=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrrDeBdB1UmtXWUT/inB9ecz+J168AI410nGONl/afiCXteG8nyisVCvDPWDSvWql
	 mFvdpsOV88LJRRXyJbSufit/vwFe9f0XEmyTmmvsYGvy+UVzxEaC/64rXjvxXcUCAe
	 ZrHi72Vm8a1e41WB37dnY9G+DrvhG8lasOIz9EmNYwIyWelcVOmKjLgKr1CSAvfFgS
	 JG/1oDyi1CYCC/rnFumO/n4mE/HcrrrB4kdyrvlpIundFLCC54uD3tgfcC6xdCKXnO
	 gVg8+TvaqWR2yBjssyhXb3mRj7JUa1rAJwIqdPjQbY72TPQ5sL0ypz1ZHJxYwHV2jb
	 VXYGQAetQLL3g==
Date: Mon, 25 May 2026 17:18:00 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
Message-ID: <ahRoKMLtrirbowbj@L30177.local>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-2-f30ab53dd97c@free.fr>
 <20260525133332.0E2291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525133332.0E2291F000E9@smtp.kernel.org>

Hi again bot,

Le 25/05/26 13:33, sashiko-bot@kernel.org a écrit :
> [Severity: High]
> This isn't a bug introduced by this patch, but does the error path for an
> oversized length need to set the TXAK bit before aborting the transaction?
> 
> Because reading I2DR automatically initiates the reception of the next byte
> with ACK enabled, returning early without setting I2CR_TXAK causes the
> controller to ACK the in-flight byte.
> 
> If the target device drives SDA low, could the subsequent cleanup via
> i2c_imx_stop() fail to emit a STOP condition and leave the bus permanently
> locked, similar to the zero-length case this patch addresses?

Yes, same as the former email on 1/2: the len > I2C_SMBUS_BLOCK_MAX path
sets STATE_FAILED and returns without a NACK+STOP, while reading I2DR has
already started the next byte.

I'll fix it in v2 by NACKing the in-flight byte and letting the normal
last-byte STOP sequence run before failing, matching the count=0 handling.

> 
> > +
> > +	if (len == 0) {
> > +		/*
> > +		 * SMBus 3.1 6.5.7 "Block Write/Read": byte count can be 0
> > +		 */
> > +		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +		temp |= I2CR_TXAK;
> > +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> 
> [Severity: High]
> This is a pre-existing issue, but is there a potential read-modify-write
> race condition on the IMX_I2C_I2CR register here?
> 
> If an I2C transaction times out, the process context calls i2c_imx_stop(),
> which locklessly clears the I2CR_MSTA bit.
> 
> If the hardware interrupt fires concurrently and the ISR reads the register
> before i2c_imx_stop() clears MSTA, then writes it back afterward, could the
> ISR overwrite the register with MSTA=1? Would this transition from 0 back to
> 1 cause the controller to erroneously generate a new START condition?

The count=0 branch uses the same read/modify/write of I2CR than every other
ISR path in this driver already does. If there is a real ISR-vs-i2c_imx_stop()
race on MSTA it should be fixed across the driver in its own patch; it is out of
scope here and it is not introduced by this code.

> 
> > +
> > +		i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = 0;
> > +		i2c_imx->msg->len = 2;
> > +		return;
> >  	}
> >  	i2c_imx->msg->len += len;
> >  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
> 
> [Severity: High]
> This is a pre-existing issue, but does the master fail to NACK the final data
> byte when performing an SMBus block read with exactly 1 byte of data?
> 
> Reading the length byte from I2DR triggers the reception of the single data
> byte, but the code does not appear to set I2CR_TXAK when the length is exactly
> 1.
> 
> During the next interrupt, when i2c_imx_isr_read_continue() attempts to issue
> a STOP condition, could the target still be expecting to send more data and
> drive SDA low, preventing the STOP condition from being generated?

This looks like a genuine pre-existing bug, but it is independent of the
block-read-of-0 fix:
for count == 1, msg->len becomes 2 and i2c_imx_isr_read_continue() enters
at msg_buf_idx == len - 1, taking the STOP branch and skipping the
(len - 2) TXAK branch,
so the single data byte is ACK'd rather than NACK'd.

It is a topic for another thread/serie.

A v2 will be sent.

thanks,
  Vincent

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr?part=2
