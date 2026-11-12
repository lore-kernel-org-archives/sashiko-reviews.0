Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496868;
	b=XMqCEVdDTYim8KWf6FmKtaV4Akw2pxu3nmB+rM1M8o5ncUjtGVd0kDe8SxB7/2VloIt2
	 UYjJbqUyaF3JN9ebcJ0I+d1G4A8W2lhsvgIRHwxNZDfpQKpv2buQBHg+k7TGC3ZG/wmmq
	 SA5uA3EldiRrGqJRfpprhEC/2PS1dYONMN4XaOTPuDTP6E+mfG5SHBhJ2vplzZ5zBUxvQ
	 7imWnNt+sGfpYMeeI6DeQbzmCI67i/ACHzDj/hw8a2SrYx97fL0T8uylIIaGXvRIzu3Bs
	 MmIUDnXkJ8mm5FrlJGTqqvq8CW9fSy1k4mFwUbY6GpbRfwmBXw9s2Z45Wngzfh9kFzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qVYK4aF8DnlATPdvPW4rrz584ZowV56FwmQpG+kYD1c=;
	b=T+vx+TUMm7rU3ACoWuCxTssEYtDNFOizYYBGQmNsHSoXnOaoTRn2G/wIqkOG4f4Mlwig
	 iaNmjUeh8jzldhg4T452mfB7LgzQQl4t9OjvDLTZCUSCNpcHgtC5lLgAftv4s2Ec+5Cdc
	 4zDuEGy2STaUnbJs8N+wjAPYHuvOK6wCp3t+Ar/xa1cw551QbsroFvdpAcRPlGAln2DCp
	 +4ro2kYkn/arvEx8vjElsV8sY0fyQNdeHvZmweo2z0u8ri0w9Qqjwju4XrBVXEK0gRffb
	 IR6o1Do2sf/TTOcSTT5VMy6YBoHV+cfamiRoZC5RXYuUdhXUu2Vd4RCNZbQHfz7CaNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLaohdxj;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006A60A6F57
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 15:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6006A60A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLaohdxj
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d473cfff6so629464066b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496867; x=1795101667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qVYK4aF8DnlATPdvPW4rrz584ZowV56FwmQpG+kYD1c=;
        b=XLaohdxjOQ3/lcPQR1i4Uwa03i43Vn/6U5NWbPJErkbzrfI5XdKi4RqLuqxJiZVGEj
         SB5ICuobTMxWwpk/WA759OhjiVYYUDerESbCary2PsW4wBCQaKYNMwyP9jYcBITXEmXK
         UiDpp++p4YnL71FGxJVvFdRFiDTQndPwtR1saEC5QYrmbpQqE2bybMgo2k2YYznngGFe
         t0+aaeZrxVWYaIitu5GmuPM7YJI7UWvDT/ujb81GG7W/EO2nJz0DtVhZ1oVJe+T4chqK
         LA1Na4uxyDyRDD8FAOPO/zJp/XAy13ZeXXUtOpIMQa15RhoKp6gQ+WsuJR5RyHrByKvF
         uMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496867; x=1795101667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVYK4aF8DnlATPdvPW4rrz584ZowV56FwmQpG+kYD1c=;
        b=ryN4k8LsnSiyO3zQcBp1kXtAqJY3qCqx6wQ/JoryROV9ZePcM7ZMXttwizoGEPD0qx
         7ap+rOVn1b1yujVqw713g08juNyH8pcdDrcgrlkjuCxRzGwt/7DDIqJefL5b6t4zw4wu
         wMIttpZtPhfvW535rEm3OITwj/NlTvsFgUOuP9Ywgo7r9MB5GxQMgas9XyXyKuy+oqD6
         LsJnC/dQeSOkBu0rRIZNNZpZJ6XmpN0Du4vsQ+DpHOEUnNaKFsTBlRrqjpDa6Oow7nCq
         rCzLZfrJFOySM5hq0rXtVqLKkyuh5elqia+6yI2JM8Z5xn68j9PprUjpgKZ8WK8msF/a
         0dtg==
X-Gm-Message-State: APuU4Z/ntopc0hA+76ir67mp1Jaba+ZZtdWdkE00KXvxReLLo7aw3Bm3
	BjExtUJDynIIhuBT0mBOD6EHzW9x+avX0NRYjapcrt8JGX8pcYXm89Rp
X-Gm-Gg: AYBFou2whR5R/KNqkuGUpf2jyrhIgHw9SvL7fFpu3PeFWMGyocWWCiY1fCvyh8ToqlO
	Zo6YI6qm5nUqMF6BlXx2j+JCC1WQKx9flgAiXe/Xf+DP8X5MBCzInnJLWbm6fLR7qacuYgoevWa
	7nRBz0n2UhZJrli9hu6aAf6fyOmVRz8jX/1JrAX9V/b2wA1wyaTxddwgI31J0hmCFV/dQ5Zy4Nk
	NH5P3tSvp7XjkPss6lE6Pz8VxHMO4L+HnpaZPirdB3ungjFREde4bpYSojWKP35xwY+B+0WtSZo
	VO2Q+nKEXPjKIDWFUXqEXYKH/9foWPyUEGrXYAggmePDUKTDCDRsd544snrj6Flp1tKfutqOUa9
	Br3VVrJPvLmpcXVl4qPoo4prBm96b2aSHfHzX4qgDAHVpKf/ZLthJRUamzKyBB4jZa+KAunHmPH
	mwROz8EX/yfGXhQncRCxyiDoxXflkFtqDPO1ALDyVoTszL+jubMoFsNyBeTcgKVaFrWamqls3Nr
	v/+cw+3fqyFC4+MruBkU8Kwass/LjTW4zyClAOLjMAO5lGH327Zyx1mr6xJ027Jc1orpXPR2TKy
	0CpLp/kJp3dty0JsgIVdF7VDhP6DsLcr0P6QXtmG+SmPS+5JC2vXatltgy33b+V7m8wdxO32DTg
	Ltfw1SfKmVfft
X-Received: by 2002:a17:907:3f11:b0:c4d:212a:192a with SMTP id a640c23a62f3a-c5066db88a8mr468170266b.48.1794496866215;
        Thu, 12 Nov 2026 07:21:06 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:5984:fa71:7b11:41c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc8fsm16385724f8f.30.2026.11.12.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:21:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:21:04 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Paolo Pisati <p.pisati@gmail.com>, 
	linux-ide@vger.kernel.org, mfd@lists.linux.dev, dlemoal@kernel.org, cassel@kernel.org
Subject: Re: [PATCH v1 1/7] zorro: warp mfd: add the CS-Lab Warp
 multifunction parent
Message-ID: <wxsfjhxzk4zrmaf3ykjgwj6sulyylqfak24xhrwa3pqroxtwgw@w66gfa7yi7jb>
References: <20261111163735.227286-1-p.pisati@gmail.com>
 <20261111163735.227286-2-p.pisati@gmail.com>
 <sashiko-outbox-209365@kernel.org>
 <20261111180442.GE6323@joneslee-macbookpro.roam.internal>
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
In-Reply-To: <20261111180442.GE6323@joneslee-macbookpro.roam.internal>

On Wed, Nov 11, 2026 at 06:04:42PM +0000, Lee Jones wrote:
> On Wed, 11 Nov 2026, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 4 potential
> > issues to consider:
> > - [Low] mfd: warp_mfd_probe() places new MFD core driver in
> >   drivers/zorro/
> > - [Low] mfd: warp_mfd_driver hard-codes mfd in names and uses wrong
> >   subject prefix
> > - [Low] mfd: warp_mfd_cells registers only a single child cell and
> >   Kconfig mismatches code
> > - [Low] mfd: warp_mfd_probe() passes z->dev.id instead of
> >   PLATFORM_DEVID_AUTO
> 
> All of these are hard blockers.
> 
> Why are you adding a whole new subsystem for your device?

No hard reason: I took inspiration from Geert's Zorro MFD experiments[1], hence the
weird location.

> 
> This clearly lives in drivers/mfd.

Ack, I'll address Sashiko's comments and i'll resubmit.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?id=0417ac04d4357f5c1bd2bd43bb188624a85149f5
-- 
bye,
p.
