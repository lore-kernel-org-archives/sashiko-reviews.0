Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706967;
	b=M0PT4JJq+bWiA1Hygub+EOlGNgtNritBXlfLegc6eZ8/3SdBYDpDSncO6pcHg4QbYJct
	 BuN1j2W6g0DMLeFJQMVxua1Wi7IfeGzRcSB9+nsysKP00q+j/qqXcC/M/5oRX7FUzPCaw
	 NxHArX3rFCkaZpWqoiKxb26Yo8VQPFFNIgrTUqKmhvgD7T0cluD3kXg8juUD3omsQeqW5
	 pcJ9O2qke3d5xJY6HvBPm5c+VLR/6fpZK09NnSeR5yLVm7LV7afd0qx51HlKKkWmw0QMT
	 fLn95rcEMxFhO6ZeDMbFvyx7DwH/e8NfrYVzGDwH1VUJfDSLVszVHxAK1u0hWwefC0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=ONK88Mc3FVMhpnTXlcgn9JF9XGNsz0fFBW8JVFGM8tQ=;
	b=oFG0xbKiAAzxAyvpdaBchEjSGHMwkj+7CTbla5J3ApPg4Lu+a1NQgAd1IQq9s2XuhqzM
	 nR37YCWPHPWKWDuvv+yxacRJzsbZzpUlU/l5JsPij/ghtceyLJEggaSXSunAEZeJyLuD8
	 GfnHHwZcUY+4h4T98brA6T/l7ey1SXmI4RRU37rakGGEOnr3Qq2MoxxTUHHfobsKvg5bY
	 gJ5Ul3TpNVeo5KhFNDCo6UqIutgfyvL5VdnhcF39ACFai35OfTPiwM4J6omxEjMjTK+xp
	 Mvko9aGz7ETo1MDkxcsxFCp4mAusYBGi6uZ/OEnfHDmSSxJTUCo9uKrkZHYGheldUhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9+DQjlF;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9002F606A326
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9002F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9+DQjlF
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so13836375ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706967; x=1794311767; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ONK88Mc3FVMhpnTXlcgn9JF9XGNsz0fFBW8JVFGM8tQ=;
        b=N9+DQjlFmrR8YS1a3OGvF8SCJgu/Vhf6AX1q1o0YSm22Ag6Sph6VBfXz+Iz6iw2r/z
         GH91vXGiRDrDgc/xCroivX/Mwtao2ev0RkMlz+fBkRQ5VPdUeSCycffs2VA0cPUm3lzS
         pI/ZkDuJNOzrLWkI12XeN+H3XxfZBNu5J6NkcozOLiU0Ift/8IAYcjTrdjNVFHTL6A9/
         6SCwKWw1lil70IuJ31RuErUlRsiOwv1X1rrxmLg5lcwo6EaEQQLVbD275zCuw9exXNKX
         zqwZJ3lmyzoMGbgDH+w3W3oMMvOYpFmx9FuC7EVZyfYkwSwvApdM3z9gDoVekHShMkuC
         91uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706967; x=1794311767;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONK88Mc3FVMhpnTXlcgn9JF9XGNsz0fFBW8JVFGM8tQ=;
        b=L1+U+bHzkIdC57eSSxw2lK4oaYursCoSelW3xaEn0cBd680vQifbVejaQtBvSckYGf
         D8hqXK7Ez9tc60aFJfjhk9vrtdyjbucJADGROnZRpWFyWPkMov7fGDOu3QR6LGW7pRX1
         TwJVnbCsEQL1+k3wFBiR/6dGYdlcmRtzmodn4SnZvYRM8u7mR/lfTM91wvC8Gf/R0KXq
         Ih0j0yGqPaYECUIUEiyTq9nxNSamu2IoXRzX4ybdkjSLz3l0oMc0tvGASj8EFHJoo/B0
         DMakZGB8gO9NCsE8p0Qy6rG+YaFRpmtt4UGGbkJmSoaHMoWZffHSFhVdY34/kELWzdLd
         CACg==
X-Forwarded-Encrypted: i=1; AKwUvByDje3wXfcvXHm24jtRz6VW0nb/EYhPSc04vbmXDiT7MmkhiFHjsKfFO41W1MfyYuRZEBk93jIJF3aexloQMn0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8JpOkYu84FSFKOQM+KuCnR5tI4hTgq8rcEv3UE8VZjxQ1HPwv8
	wIEkKnU7TJXdbiNwjOHZ4YxK3fZBip1hLO5wIk9or/1sp7annyo0yU6P
X-Gm-Gg: AYBFou36UgUpqocQ6j1WYLoN0ypFVmLSIlNbz+fY2PTYzIGZQ8YszUQ8Vl+79yQRp0w
	BVnOKvpZtH2/Qv7QcHcpY67ncW8/BxoEE8eoUSTETIC42GV1mXsvmVAjN/X0zzuC/793fBiEjeu
	YNeLP8MBwH9etZIrf6WvQP63bAGMkjuoZzKp6KX5suP+7EeuSu4Vc+TjDVGdLXNjMkMlBQpLrF/
	lZ+ZyJpeMGjOTkET1a716AKgs6n3DbuqwnszXksmuNtnhgjuQFCJ8XjtK4YFDmx51afysKdHSFq
	prWOr4H2Mmx4unVgxua1NK9Q2R+Zk8WTSmYCdpOHxVijk9bl0qLq74F1LPijYLxjnAxB/xm08Bn
	4nptlKkSknpQshihXqR+5oG/x4KJCDkaUl9BI2xZIVdro6sHpizQUfudwmIE01roq8UooX7Bfyu
	nvTzBEIAjPzdtt/KlDCZyUKIJVmo7chxnqU2eITUWOPjxQXMSflba7flH5rxM4y3dka80/Ca86B
	kEV1kZEDDEP6t5eeA+OYFo87zE+Zj1JsFcMlyQIIws447Oh+8Yx7cupzBM074+aX9DvOlFkvK7N
	W+A6O87PcYwLSg7oMO1pZBRsfVMYn34qi/Pub/F1t4TInnBc7WmSDRpTCEWaIBGL0IoALyE25iJ
	eurxDBBLr88U0e2YhRuvOP86yI4E=
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6987759a91.28.1793706966861;
        Tue, 03 Nov 2026 03:56:06 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc89475asm5134252a91.0.2026.11.03.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:56:06 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/damon/core: reject empty access pattern intervals
 on scheme commit
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 03 Nov 2026 22:44:03 +1100
Message-Id: <179370624368.195197.14262032219867976650.b4-reply@b4>
To: "Xiaolei Wang (Kaihong)" <xiaoleiwangxiaolei@gmail.com>
Cc: akpm@linux-foundation.org, damon@lists.linux.dev, david@kernel.org, 
 error27@gmail.com, "Liam R. Howlett" <liam@infradead.org>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, sj@kernel.org, 
 stable@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>
In-Reply-To: <20261103105418.362459-1-xiaoleiwangxiaolei@gmail.com>
References: <20261103105418.362459-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: b4 0.16.0

Hi Xiaolei,

On Tue, 03 Nov 2026 18:54:18 +0800 Xiaolei Wang (Kaihong) wrote:

> At runtime __damos_valid_target() evaluates "min <= x <= max" for each
> of the three pattern dimensions.  A reversed interval is an empty set,
> so every region fails the check and the scheme silently never matches
> anything: nr_tried stays zero forever while the kdamond keeps running
> normally.

My understanding is that DAMON just does what the user asked for here,
so this looks more like an input validation improvement than a bug fix.
Since previously accepted input would now fail with -EINVAL, maybe drop
the Fixes: and Cc: stable tags, and mention the behavior change in the
changelog?

> The same holds for the watermarks thresholds, which must be monotonic
> (low <= mid <= high).

Not for all cases, I think.  With mid > high (and low <= high), the
scheme still works; mid just has no effect.  The subject would also
need to mention watermarks.

> +	if (p->min_sz_region > p->max_sz_region ||
> +	    p->min_nr_accesses > p->max_nr_accesses ||
> +	    p->min_age_region > p->max_age_region)
> +		return -EINVAL;

As Sashiko pointed out, this would break the DAMON sysfs.py selftest,
which uses size=[4096, 2**10].  Maybe update it together, and also add
a kunit case and a note in the DAMON usage document?

Thanks,
Aveline Noir
