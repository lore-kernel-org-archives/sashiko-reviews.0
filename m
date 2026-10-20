Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498976;
	b=QOFwhlyTZXhGrwd7Fgs5xldNa0ePR1PVvhbWED3zExzeUBSBj0ysP76I7PcklWvj/BrB
	 HyO2nVRwn4x3EY4ThTR8rQ6CociLadAx7VYsPLcBCJwG0fSLiMH9Tb/kk3ue/C7fzp8SL
	 +AEowhWNr6hepgYUanyuhq+kFocAgu0lyW911eZKjJsuut+z+8+z7kWaSgPMjngEjXckV
	 yZRYsvYDGCrKKdm1Q6xv0NpAqE6r6PsSpZU0L1HgXzVu+/gDwFI87QFOhnf6L05Xxe0uG
	 X0VHzaBqO3JOKfdKRKoPD0IRkDJdIMT6gJLz1zXTpx8kbFLnySCnOCmveX+G09bCTLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498976;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=djQ3Q7Yc7qYR6QlBqQGd3KlgFJ/O0q3VHjue4ySZa3c=;
	b=Frt3KlV1xX2QJRYTd650ByLeuxqBSF0D5N4ridNfkKQmNuXI3ADVogaUwN7mKmWb3zc3
	 y3UEnAS7Gw3W462M98HWgxMFm8QW4mlQJU3UKIAfMThTmaU5/u0zh7FUUx1II0g9Ytqd3
	 de0yfiswDX9lx8sWDJuNlrjdeDJn8V3G3XGoaEJA3f8WVMU1kTYCw9UTVTJxnsI7TRFOy
	 laUF76j0iVmNGNyD8TswpdoNCqgtqDYyLFWLb+Xyk+96CDxrPy8eNGzAS43ZIO/MDZaMg
	 GApWkWfowhogwDCvOuKpkni7CtZ336YOuW/W0R0KtPOmXMFNFi0bw8bX5HNfsgfn6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkEhhKPh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F551606A31E;
	Tue, 20 Oct 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkEhhKPh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415711F000C4;
	Tue, 20 Oct 2026 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498976;
	bh=djQ3Q7Yc7qYR6QlBqQGd3KlgFJ/O0q3VHjue4ySZa3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkEhhKPh1fEj083IxkEypY8DCZo4ZWRk+U2JPvgsoXe2uBV83LaCUmUpXH/jsqEe3
	 8ZL8b0qgoB92jpBhtmi+xwozuRBoo17CVkhWeZKVmttqn9fJuF6r6MQ5VcJLLxCVbv
	 fIuNENhpWC7TBfjlR13+lyoNQN8WrIEhFfw+KDGOMFGo5cmT33PKWpdf5VQjFfatY5
	 EO7/MUDGcwEIsdsRuI0rq5hUrtKvSw8WTMseEzPq+MOmx43PApXvuZCCp+tjDrAaRh
	 U2Vyl/zrPlgYJcLeL362CT2G3LkcZhHUTB4Oiv1yvg401cOv1kfMMZPyHYhldGN5y3
	 EZLGObX8V4M6w==
Date: Tue, 20 Oct 2026 13:22:52 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev
Subject: Re: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to
 indicate a device will detach
Message-ID: <20261020122252.GD1795367@google.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
 <20260924121706.432811F000FF@smtp.kernel.org>
 <20261020112658.GB1795367@google.com>
 <atdZte6J62k0QCEC@opensource.cirrus.com>
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
In-Reply-To: <atdZte6J62k0QCEC@opensource.cirrus.com>

On Tue, 20 Oct 2026, Charles Keepax wrote:

> On Tue, Oct 20, 2026 at 12:26:58PM +0100, Lee Jones wrote:
> > On Thu, 24 Sep 2026, sashiko-bot@kernel.org wrote:
> > 
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] soundwire: data race in sdw_slave_signal_unattach() with complete_all()
> > 
> > Charles, did you answer this?
> 
> Yeah, although Vinod wouldn't have been on either the Sashiko
> email or the response.
> 
> > Maybe this is why Vinod isn't replying?
> 
> He has replied, he acked the patch:
> 
> https://lore.kernel.org/linux-sound/asC1SwHb4DZkJ4Pr@parshuram/
> 
> This resend is identical to that version, I would have carried the
> ack but unfortunately he acked that version after I did this
> resend.
> 
> Also in this email he says he is happy for things to go through
> either tree:
> 
> https://lore.kernel.org/linux-sound/asC1kM-aOjl0GYYx@parshuram/
> 
> I can do another resend carrying the ack if that is helpful?

Yes please.

-- 
Lee Jones
