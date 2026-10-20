Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495623;
	b=2BP1x0RuTrhFgQ2BS6C/ANGH4P0wbNqf+ut6J689/PObAtkPa35YlNkIjUIkruZkZBY+
	 8Qe+UQDXYt7pK8JPRQmyGhXzPcpiBFmXxMpa5dJk5HULKLjmM5bRqI217eCHi7eCOx2HS
	 TGng5ELg+lWk8M12PNlqHtFT6o9+5HrJMfua5ffACHbbEdybn2i7zZWE1QibPASk1CDrq
	 LQ3+RpmcS4r0ywdUs+YlOvVrA+kNZV61sTkwvv62s9/l6nIolZttkSpduK0UbZVeLNI4a
	 6KmZPBp2oqpceTKjAY8xNmT1JNWp2nAFFf2bYfD8PZhJhpRMAyclcXS9W6Kv+ytPwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495623;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9IuNGgu3+n8EnXEqNr9sfqGmADrlCNKPBop93Whvr/M=;
	b=1mckYZgjE4D5DdyZcpeeY8pYoHCWduu/cL7pYOYFq/3Sj5JMs7RjT2z6NQh9uPVYRg72
	 xV4z74E8wVSb0/1SBcaIsufbfgjlsXQtEN7NyV91CsZT3zxMU1+O3Mdogrd837SK6rFIn
	 BZthvRsobme7Z9Q6stzoXYJxvHmN84W/U3LZcD/laypXiL4LQYWaFrzdBrAKndfg+qVHp
	 GZ/WaOF2yc5fM3D1bi9/pOG9i5BfAn4RX6+RTy1c8yLiwTsi6tMd+OXzTiFlapeXTkGH/
	 uimIPVGYSUC6N5N5VpnnHHA4SdjHnzBLUiJG8C2WRbyqZh7mGjhdjBlMSgyjDOjg3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kngWsQhr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D16606A319;
	Tue, 20 Oct 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kngWsQhr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E2B1F000C6;
	Tue, 20 Oct 2026 11:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495622;
	bh=9IuNGgu3+n8EnXEqNr9sfqGmADrlCNKPBop93Whvr/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kngWsQhrwAC3fMs5oD32NO1HRJe/5g7ROr0sWqh9Wkn8SnMApos/5zyXTX64BhcCd
	 fR85L1zsQhl4kWmdZtxDF18lJjrJD9rh3BkLaEM0D7O6gaNdoe8Uaay1gMybd4saOI
	 yOP4u8aOoOb8v0N7WPvj/O/JMCxv3+KTKUCwsv4gY9e8EXAJju0XkOsNML/hCpyAZh
	 QpUAN6s8ZnLBNSnugIKmQPBrSdf2MuSHGycxs1EorkGzrug1eSh/elAiXr+mS4iqf8
	 hePYSTpviLfqTF2nYPVq3hivBh4tjS3aUV3ijZRGfhattrZn+t6AFdywm5ekR7grxC
	 aOwAxYWYY52Ug==
Date: Tue, 20 Oct 2026 12:26:58 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, mfd@lists.linux.dev
Subject: Re: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to
 indicate a device will detach
Message-ID: <20261020112658.GB1795367@google.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
 <20260924121706.432811F000FF@smtp.kernel.org>
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
In-Reply-To: <20260924121706.432811F000FF@smtp.kernel.org>

On Thu, 24 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] soundwire: data race in sdw_slave_signal_unattach() with complete_all()

Charles, did you answer this?

Maybe this is why Vinod isn't replying?

> --
> 
> commit 0022c8987af32edaf369ec5a75ade11e2d3a1ba3
> Author: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> soundwire: Add a helper function to indicate a device will detach
> 
> Add a helper function that a driver can call to indicate it is about to
> initiate an action that will cause the device to detach from the bus.
> 
> > diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> > index 707ca6bd1e23d..7d41df30561cf 100644
> > --- a/include/linux/soundwire/sdw.h
> > +++ b/include/linux/soundwire/sdw.h
> 
> [ ... ]
> 
> > @@ -1214,6 +1221,25 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
> >  
> >  #endif /* CONFIG_SOUNDWIRE */
> >  
> > +/**
> > + * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
> > + * @slave: Pointer to the SoundWire peripheral.
> > + *
> > + * Inform the core that the peripheral is about to detach from the bus, this
> > + * is usually due to some implementation defined reset mechanism. After this
> > + * sdw_slave_wait_for_init() should be called to wait for the device to
> > + * return.
> > + */
> > +static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
> > +{
> > +	if (!slave)
> > +		return;
> > +
> > +	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
> > +	reinit_completion(&slave->enumeration_complete);
> > +	reinit_completion(&slave->initialization_complete);
> 
> [Severity: High]
> Is there a risk of a data race here in sdw_slave_signal_unattach() with
> complete_all()?
> 
> Since reinit_completion() is non-atomic and executes locklessly here, a race
> can occur if the bus ping thread concurrently processes a previous or bouncing
> ATTACHED event in sdw_handle_slave_status(), which calls complete_all().
> 
> If complete_all() finishes after the zeroing, the completion remains marked
> as done.
> 
> Would this cause subsequent calls to sdw_slave_wait_for_init() to return
> immediately, and potentially lead the driver to perform I/O against a
> detached device?
> 
> > +}
> > +
> >  /**
> >   * sdw_slave_wait_for_init - Wait for device initialisation
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260924120520.2511081-1-ckeepax@opensource.cirrus.com?part=1

-- 
Lee Jones
