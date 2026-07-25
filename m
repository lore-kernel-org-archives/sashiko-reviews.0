Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D8A35200F
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785007265; cv=none; b=hRfFzpIHweWdj5zHsFrlONU/W7ySmZlgjFmdIUGnw8tXQ0Ta5uq173SW04vA49tnOGumfP6H8CAjeZM5MkSuwtrJlTwAZhJWDwp//UNMLxc905X1dgML46RlwRaaL5yb/bzRGmNaOoQ11/PCXcJkNq4N5gyrgElQBEieHgSQNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785007265; c=relaxed/simple;
	bh=bbXKsLmsWgE5qcfQH6W3dtcu7Nl3Mn1hAuZTK1MZ9JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKTG00Eh5b38YXYIgtgaqtAoOE04Gm0sBmMIh7May0tbTD46aH5VkAFmObMNX/DYpY9Ml+E5ku+iXMBd54mxHk499frCiiRr+e42UdGYhMO3io0z+gtzaaMCAugxAu5fRZqPLYHMtfBj01m3ad69DNu9CIS4paR3tPEJf6u8MZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZ48l1EO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZ48l1EO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954df200ddso9740285e9.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 12:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785007262; x=1785612062; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGq1MYuzS+pjKAqXa5uKrnlzlVFHDeU8OLo2EF6piLs=;
        b=KZ48l1EO1d/rT6FaYVaUgpOUuW7g8LyLHH/vXBoGRAJYrT8itNwKg2ubjX30QaQKxZ
         c93dVYq+KeEvd5yY1ObXD84e3N1+sse+R8t4et85ndoDUNTr2POaEa7In4i2P2tZp6au
         nMbX52fDBaFWqSxlY0GxoQx0KkXGN36LWgDCwcNacZ5Ueltq7HKYgDrDWaR7ie7jDCjL
         w8Qg1B4zddY9QTaL9JoYvagPt6gvXzZbvrT7+JHQAB3ewU/SV1A8xYFXtBEgSa4MtoMq
         Uuaa+A2Y0E0nvS2UvW1I/eIeavjOabO9ilyvPE4gTryDGbnos0UcgPvuWU+Dp+IbZaEe
         Xpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785007262; x=1785612062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BGq1MYuzS+pjKAqXa5uKrnlzlVFHDeU8OLo2EF6piLs=;
        b=lAneToouF6k6AL7Nmx6rZ5e4XB7wsJ0uLU3i79YPQcFlPieavGtpBCXNqavINw5vzt
         N920nFm6aeM5dZBxwTgEk4DIRaJlz5vgXf39XXfpcxqDTbVmIApqAjBX5S6ONq/83v9l
         fWPAhJiQHrUwXgVDYw4pOQJI5TJr5eZ6BomIdv1y8Cdfg7FYI01ar4CxN4AsE6NQC2bj
         lb2I85dqwHfB3fmLsqcaz77VWdy1lHOaf30TYNtsmCTtOFgbM57oiwRHEvVMQ0DAVP37
         H4AAExJaDXvdK8vBVLKTHkwByYfiFo1al6Xl5b6JxqizZmxPSmMNjumVP4fqWmNA9l8m
         9sOw==
X-Gm-Message-State: AOJu0Yzh+wnH84RW+aLWaw5xPl2w/QPJL0avR1oy0cHWzuLEztEnNZDr
	w60xRyhVCCf++ohfJGOKwx5rebYV+IaJ6GnDp+ik9MVNS72NEVl0OpdrI1jb6mGF
X-Gm-Gg: AR+sD12xXI4ekmcreuHNFiUQpLxHCDP4l+EpILISJCHD9SAV5Lvo3HeY72PImFhFFW6
	pgvPzVBw9klajXvS8prDBoTckSRq+D9sj1myetU22SQTzJVSX3zG8/4V7HzAkXYJeDgxeAK0tlJ
	jq42oHteSGNQW+OeuCo1OpOxvDJKR3aMeKjn/c6x3K1PzdryFiJeBps4masghPO9HyL41MQ1iWU
	021ao5Ersz8hfoAJ0F3HD9ljePwCK+JC12sek+e8Ork27wU3ATX6/JthRUhVAJupkgCcykviJAm
	MWnopV1487QeS8rBl7lSlWWRDu3iDzOHaNLu84eK0H0LiUXuG8ra5V4Y9raopyKKeudFyGoQTDS
	kPdkFF50hi7+geK9pFGrHuoLdjJ1X0nrHSbBbf06Qbu48gZugip8nPptLQ41o6fXRh5gpUqLfuF
	s2+g==
X-Received: by 2002:a05:600c:5487:b0:495:7287:293f with SMTP id 5b1f17b1804b1-496b690a85dmr29215635e9.35.1785007261955;
        Sat, 25 Jul 2026 12:21:01 -0700 (PDT)
Received: from antoniarch ([78.212.96.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49b2ffdsm86513875e9.15.2026.07.25.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 12:21:01 -0700 (PDT)
Date: Sat, 25 Jul 2026 21:19:36 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	robh@kernel.org
Subject: Re: [PATCH v2 2/8] rtc: abx80x: move part autodetection before
 RV1805 configuration
Message-ID: <amUI6JY3BFTrbdqp@antoniarch>
References: <20260725145718.14733-1-apokusinski01@gmail.com>
 <20260725145718.14733-3-apokusinski01@gmail.com>
 <20260725150753.325271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725150753.325271F000E9@smtp.kernel.org>

On Sat, Jul 25, 2026 at 03:07:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch fails to resolve the issue it describes because part autodetection for the RV1805 incorrectly resolves to AB1805.
> --
> 
> --- Patch [2]: [PATCH v2 2/8] rtc: abx80x: move part autodetection before RV1805 configuration ---
> commit e37ea6c1257442ff3423e6bacb742916beb85bbb
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: move part autodetection before RV1805 configuration
> 
> This commit moves the part autodetection logic before the RV1805
> configuration block. The intention is to ensure the RV1805 specifics are
> applied even when the driver is bound using a generic compatible string.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 5486d9d0b1e5d..ca3af91c29977 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> > @@ -814,6 +814,25 @@ static int abx80x_probe(struct i2c_client *client)
> >  		return -EIO;
> >  	}
> >  
> > +	/* part autodetection */
> > +	if (part == ABX80X) {
> > +		for (i = 0; abx80x_caps[i].pn; i++)
> > +			if (partnumber == abx80x_caps[i].pn)
> > +				break;
> 
> [Severity: Medium]
> Does this code introduce a regression by preventing the RV1805 configuration
> from running during autodetection?
> 
> Since AB1805 and RV1805 share the same part number (0x1805), and AB1805
> appears earlier in the abx80x_caps array, it appears this loop will always
> match AB1805 first.
> 
> If the driver is bound using the generic abracon,abx80x compatible string,
> part will be set to AB1805 instead of RV1805.
> 
Ok so I missed the fact that "AB1805 and RV1805 share the same part number".
Hence, I see no way to make the driver run the RV1805 configuration when
it is bound using the generic ABX80X, because it may happen that the
detected part is RV1805 even though the real one is AB1805 or the
reverse (depending on the order that we define in `abx80x_caps[]`).
Therefore, I'll drop this patch in v3 and leave things as they were
(i.e. autodetecton after the `if (part == RV1805)` ).
 
> > +		if (abx80x_caps[i].pn == 0) {
> > +			dev_err(&client->dev, "Unknown part: %04x\n",
> > +				partnumber);
> > +			return -EINVAL;
> > +		}
> > +		part = i;
> > +	}
> > +
> > +	if (partnumber != abx80x_caps[part].pn) {
> > +		dev_err(&client->dev, "partnumber mismatch %04x != %04x\n",
> > +			partnumber, abx80x_caps[part].pn);
> > +		return -EINVAL;
> > +	}
> > +
> >  	/* Configure RV1805 specifics */
> >  	if (part == RV1805) {
> 
> [Severity: Medium]
> Will this check now evaluate to false due to the autodetection resolving to
> AB1805 above?
> 
> If part is overwritten with AB1805 during autodetection, the RV1805 specifics
> will continue to be silently skipped. This leaves the device vulnerable to
> accidentally entering test mode and leaking extra power, meaning the patch
> might not resolve the issue it describes.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260725145718.14733-1-apokusinski01@gmail.com?part=2
