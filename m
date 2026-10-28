Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198328;
	b=BDF6Ygoh6AnDC9DntaoFdpumrOSQVRv3aLTeIHT80Ft1BSuy0kGMSRuSsU/zHcatkN6+
	 0pbp/icWQfsSnPai0YtEUNUXKM5hR72UCWCHi8biY/RCIpq2yU/vcbh/2s3TDuGsdOzYK
	 g+x4XJptNj03qVSdqv7qPaWUXX4lzXPf8yk2KTg55gOJx6bEkBYNJna2hfJt+9xAC1J7E
	 yLM+hMnoEqa2HDOeHsuj8sedx/KxJVBqo46yVJ2vuaDr/NLdrwjPa5RMhcBhhmyy7vVX2
	 t+f3EvrRaX6DSQY4jxFhm6EzWn0u03VGH1MNEYJcbVQl2n8i+w5BRg3UvIiu9vmOtvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198328;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=SnfC11lBqSwGEZV+IjWp8V4OqIU6oUVstiBOgog+6c4=;
	b=eiXNnk8NsEFI+f4pjmaHSwzGGoiREg4rcRlzknOKMgIUjd0LgzZPThWLgxYV2lX4rpWZ
	 cHIPws9rbk7jmUG12yacwT7n1VX7RWTRHxXtwH7Unjq+N9WSavw7l5aUcghAtmrj8i2QM
	 xHKxnJ8EKoI2DGUFoC65c1seWxezH1piIp56nY233/wPscA0gL8cEH40rMP0qYN0ifnXN
	 ErveXrmZhQpuJArpKeoF81xeBHXQ59Qx2D5PnGTB8ayqobaZDdXFmISWnVrR9nA8Ngygn
	 8lfQk5nBsnA4g99VR4oW0/AL5pAb7D9LU01KpP2SiT3VdNeJ7mLi7Ntl5kCK73QiN5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dJBU/nlW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EE606A31C;
	Wed, 28 Oct 2026 14:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJBU/nlW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2CE1F01825;
	Wed, 28 Oct 2026 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198327;
	bh=SnfC11lBqSwGEZV+IjWp8V4OqIU6oUVstiBOgog+6c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dJBU/nlWWQHKNVaRdNkkaRFDgtvbedlBauV5VCi4/IvPiXBceFOSotrwouY7k9X8K
	 XikIvFl+bJt+3WeEGBHEJarNa8gXOXWJQQdp3hmjIS4lyQNCUd8oK15B5ZmFRdFzx1
	 jdn4t2UYY0hLKxgCOBgwMlWCb0do8F2xNYdfr7B+TWGc0ArCBAPGmJF83HiX3zUaPw
	 I59ecVSZo8zZMGefVZ3obNjL4TE52Fk5ErVGfVjET/CqLRTJqZ871H2JiRcN25svw6
	 XmF2ULR9Xs8lJGWlT2NKIR4CXiMMIcsm6ReX2h12Y1LnH6/0lCItelkrNukA3D2ZXU
	 i22s03wS8b0Rw==
Date: Wed, 28 Oct 2026 14:38:44 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jiale Yao <yaojiale02@163.com>, mfd@lists.linux.dev
Subject: Re: [PATCH 1/2] mfd: si476x: queue polling work on freezable
 workqueue
Message-ID: <20261028143844.GB3605912@google.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
 <20261016100503.2581955-2-yaojiale02@163.com>
 <sashiko-outbox-174149@kernel.org>
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
In-Reply-To: <sashiko-outbox-174149@kernel.org>

On Fri, 16 Oct 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] mfd: si476x: cross-device race on static io_errors_count

This needs an answer.

> - [Low] mfd: commit message description capitalization
> --
> 
> commit 42712fe1738df7fa331aa622d7a9ed0967efc78f
> Author: Jiale Yao <yaojiale02@163.com>
> 
>     mfd: si476x: queue polling work on freezable workqueue
> 
> This commit changes the polling work for SI476x devices to use the freezable
> system workqueue. This ensures that the continuous I2C polling stops before
> device suspend and properly resumes afterward, preventing transfers after the
> adapter has been suspended.
> 
> >     mfd: si476x: queue polling work on freezable workqueue
> 
> [Severity: Low]
> This isn't a bug, but the MFD subsystem requires capitalizing the description
> after the subsystem prefix. Should "queue" be "Queue"?
> 
> > diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> > index 9bce720a0a082..8d952113f8a6f 100644
> > --- a/drivers/mfd/si476x-i2c.c
> > +++ b/drivers/mfd/si476x-i2c.c
> 
> [ ... ]
> 
> > @@ -97,8 +98,8 @@ static int si476x_core_config_pinmux(struct si476x_core *core)
> >  
> >  static inline void si476x_core_schedule_polling_work(struct si476x_core *core)
> >  {
> > -	schedule_delayed_work(&core->status_monitor,
> > -			      usecs_to_jiffies(SI476X_STATUS_POLL_US));
> > +	queue_delayed_work(system_freezable_wq, &core->status_monitor,
> > +			   usecs_to_jiffies(SI476X_STATUS_POLL_US));
> >  }
> 
> [Severity: Medium]
> Will this polling work cause regressions if multiple si476x devices are present?
> 
> Looking at si476x_core_i2c_xfer(), which is called during the polling loop to
> check device status:
> 
> drivers/mfd/si476x-i2c.c:si476x_core_i2c_xfer() {
>     ...
> 	static int io_errors_count;
> 	int err;
>     ...
> 	if (err < 0) {
> 		if (io_errors_count++ > SI476X_MAX_IO_ERRORS)
> 			si476x_core_pronounce_dead(core);
> 	} else {
> 		io_errors_count = 0;
> 	}
>     ...
> }
> 
> Because io_errors_count is static and accessed without locking, won't
> concurrent I2C transfers from different devices race to modify it?
> 
> A successful read on one device could falsely reset the error count for a
> failing device, preventing it from being pronounced dead. Conversely,
> concurrent errors across multiple devices could accumulate together and
> falsely trigger si476x_core_pronounce_dead() prematurely.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261016100503.2581955-1-yaojiale02@163.com?part=1

-- 
Lee Jones
