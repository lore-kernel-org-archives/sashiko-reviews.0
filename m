Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704163;
	b=KfF+HNeMit4f9OC8277LPSOLVa8Q9hwUmxjptkc+Eh2O47Ehkm8h6TKijm0mgT5vA+Fk
	 7NOubZoVQPWWgKBQ837E3UxN6j1fCP6PS/TsPd2gBz2AdlBFLNuF6FSxPGxGzJ8RINPVK
	 Fg4P/eHbvHNPNfnADpimpyphDhj0Sz3DkOEiDDIW//CD5jraBTtHOBaW+Poxzd2pS8duH
	 APVn2DhWHOuNTzvxUODK/+5mXo9Z+45q5c5RnEznOVNesHy4td3kB0KCS+iS67mg4SqAc
	 Xy728QTXq7jtPXDaUDhcr9enPUM/j7xfiYhjdXf80zdiNxppav5WWcStx1+UmbIXXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704163;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Jcfj7WdXp+7DQJAax92CevGM73lPbrrQln0NRt4UtBM=;
	b=jR2v18nH3f+daMU97bhuojGFkUqJAyUAc+WAJCx1hFxOkn1JBQ/DVfgmpRM4zJimQ96k
	 niGxZgovWvqZNdLsuMO0hKtnRBa5U1pmqsxpeLO4pKflFd3CGTxpZHvzk9dDE+1V9TAN8
	 11eR691ddlL8YAtLHFmP4oU5JIqUF7HOdsXopRW6tvGQSGOZ54SW84VrqXaZA6i28Q1Qm
	 XSC7YiwclvNV4QieVSwINMQ27VOUb3ORJSNG3fes6lkRiuRh/UpXyEVgkDjLP+9PKExv5
	 IFEZqLY3Cm9aKBoZc0s2NoMOu4G3IGTRwCM9iD4jJbWONu9qSt6xWD1opXZc0g/Z9xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2VW+YDf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AC0606B119;
	Tue,  3 Nov 2026 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2VW+YDf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA081F00A1F;
	Tue,  3 Nov 2026 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704163;
	bh=Jcfj7WdXp+7DQJAax92CevGM73lPbrrQln0NRt4UtBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N2VW+YDf3xn4Zv98bvWx7BIdEiqMrXvObMaCihjLUSuhgk/Nla0aNYgGOYUwSb1Ua
	 CFKEdemLv1Ld/mab4h3+kbKGUSZn5rzfmOIG9veZrmkD/tWJg0TbDTOL9C60p0Zq7H
	 bWvpXTUECNKhsX2Gs66PJbm23pKv+KjaNDoHmYeVBEjUIgMNFPOJfuEnW/a7FtJ/B3
	 TLENl0dnVKZ4siMKLyAQGWlA+1n74VrZm7sFLECuzXisDOXJA6Tn3tIWoKTDF1kKNx
	 x8Tqzl99cMICORtwZZQua24Puv007GgA+Zti8ZqQP2VNkuw8Jhp0MppuzYleNzWYhu
	 GGEl2kinNwvug==
Date: Tue, 3 Nov 2026 11:09:19 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 04/10] soundwire: stream: Clean up allocated runtime
 resources on config failure
Message-ID: <20261103110919.GA792264@google.com>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-5-lee@kernel.org>
 <sashiko-outbox-195018@kernel.org>
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
In-Reply-To: <sashiko-outbox-195018@kernel.org>

On Tue, 03 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] soundwire: stream: unrolled stream params on error in sdw_stream_add_slave()

Well that is frustrating!  This passes local Sashiko review.

> --
> 
> commit 7c1be891cc3e3787d68318b2ed777a711e4d3fa4
> Author: Lee Jones <lee@kernel.org>
> 
> soundwire: stream: Clean up allocated runtime resources on config failure
> 
> This commit updates sdw_stream_add_master(), sdw_stream_add_slave(), and
> sdw_slave_port_alloc() in drivers/soundwire/stream.c to release newly
> allocated port and runtime structures when stream or port configuration
> fails.
> 
> > diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> > index db62a68c09f84..e3cdd36be1a1f 100644
> > --- a/drivers/soundwire/stream.c
> > +++ b/drivers/soundwire/stream.c
> 
> [ ... ]
> 
> > @@ -2198,24 +2212,26 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
> >  		ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
> >  		if (ret)
> >  			goto alloc_error;
> > +
> > +		alloc_slave_port = true;
> >  	}
> >  
> >  	ret =  sdw_master_rt_config(m_rt, stream_config);
> >  	if (ret)
> > -		goto unlock;
> > +		goto alloc_error;
> >  
> >  	ret = sdw_slave_rt_config(s_rt, stream_config);
> >  	if (ret)
> > -		goto unlock;
> > +		goto alloc_error;
> >  
> >  	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
> >  	if (ret)
> > -		goto unlock;
> > +		goto alloc_error;
> >  
> >  	ret = sdw_slave_port_config(slave, s_rt, port_config,
> >  				    stream->type == SDW_STREAM_BPT);
> >  	if (ret)
> > -		goto unlock;
> > +		goto alloc_error;
> >  
> >  	/*
> >  	 * Change stream state to CONFIGURED on first Slave add.
> > @@ -2232,6 +2248,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
> >  	 * is intentional, the 'master_rt_free' will call sdw_slave_rt_free()
> >  	 * internally.
> >  	 */
> > +	if (alloc_slave_port)
> > +		sdw_slave_port_free(slave, stream);
> >  	if (alloc_master_rt)
> >  		sdw_master_rt_free(m_rt, stream);
> >  	else if (alloc_slave_rt)
> 
> [Severity: Medium]
> If sdw_slave_port_config() fails in sdw_stream_add_slave() (for example,
> when sdw_slave_port_is_valid_range() or sdw_get_slave_dpn_prop() returns
> -EINVAL, or when port_config[i].num is non-zero on a BPT stream), does
> jumping to alloc_error leave stream->params and any pre-existing m_rt or
> s_rt modified?
> 
> Before sdw_slave_port_config() runs, sdw_config_stream() in
> drivers/soundwire/stream.c has already updated the stream parameters:
> 
> 	stream->type = stream_config->type;
> 	stream->params.rate = stream_config->frame_rate;
> 	stream->params.bps = stream_config->bps;
> 
> 	/* TODO: Update this check during Device-device support */
> 	if (is_slave)
> 		stream->params.ch_count += stream_config->ch_count;
> 
> And sdw_master_rt_config() and sdw_slave_rt_config() have already updated
> ch_count and direction on m_rt and s_rt.
> 
> When sdw_slave_port_config() fails and jumps to alloc_error, the newly
> allocated ports and runtime structures are freed so the slave is no longer
> attached to the stream, but stream->params.ch_count remains incremented by
> stream_config->ch_count and stream->params.rate, stream->params.bps, and
> stream->type remain set to the failed configuration. Could
> sdw_slave_port_config() (or its validation checks) be performed before
> mutating stream->params, m_rt, and s_rt, or should those state changes be
> rolled back under alloc_error?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261103095445.81414-1-lee@kernel.org?part=4

-- 
Lee Jones
