Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7723B05BB
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180700; cv=pass; b=MuA5FwjlkPVQOmaihpAzJCKN7ky3qg2foSVxYS2V0WisXR6yFEIKRISpKH9HM7AViAUrq9AOwmUiYgfZIfSYVqLkRL6637eK6SQ6q2Ex7OFGKkkvLK5QdFqejIb4hgH5xCf5oqH9FMUn4Z2UfB20iBzBjh7QKrM2rpnOLkyhqEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180700; c=relaxed/simple;
	bh=v2Gm0lydBXMGnjaYHnDwmar3OPX3zd9bqOVMn0dSuwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cz/nZN/5UeK+owZGvKV5RVKWxX6ycJJUn1GA795sUcGUL/NEy5zoU6cVY90N0jujViyIarIeW+ic9HGMsulYxdzXb4UMfH0x4+esgbKqPKb5e4a1bQ544zk9AJuIUOjNKtZtvgWIsxp4uCCQDylHhdSXj6HcSNUbL5TEGZcyUIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMcJOB93; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMcJOB93"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so347924a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786180699; cv=none;
        d=google.com; s=arc-20260327;
        b=NIRy226uUML8sIYnCmmFbnbB2DfHDA529NJlnVa5vF+XPhw1JAf0KJ6En0MASB9FOP
         vvl0jrvoerttsFtL+QaN5MZ+6rJCx9DSv87xWELP/TbotqX3O1b8M857pMbFOfZ6figY
         KJfD5XPcf2hPGrB458cdhjsvSUTCvnkLpAsf36MuZ5jIDTh3PFyaaBG8QSkpUjvdk81f
         KnUmflv3AviIQpvlstBJSV1L0aSzF20NTqT8I+P7BVZaOoKB6lYnjFtmo/wz2UUnhicx
         /eA0Z8QD/DITylyNTphUxKLo3gkbuQc5UF/XGHzLwqX6JloAuiVYMYGJMwQQ8zQbEU9B
         Ky6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v2Gm0lydBXMGnjaYHnDwmar3OPX3zd9bqOVMn0dSuwQ=;
        fh=zt2hjtFWVrBSbexOnXx/digRN2O0tNSOK4/ceCsrIlE=;
        b=HYb+beoavIYhkyhLHvrZ6Gnw8caf00cOtdEeKn82vsd3FLxDwVSgQKAp29H4WJN/Xb
         WQ6CHF4hxRR6IDc49UZHrbUOBj1mW9R+u35Lj17AQ0EPeWTjP/r/a5/7l7jYoDWFtmYw
         XB+Jp6XI5nbLW2Ua/0nXaA0RnNeKeYrVoF+/2PqyaU3wkgA4wG9bDY1qKJh53rbRTJ6l
         p2PSsZiMvCXWjd0RRggma/iIgq63O2MBnf+JKIcH9gJGVx50APtMZqONwiL+RdHpQkvm
         iKoYIHpcnkPyUudDeh2b0jA1snJ1tUNnNpJClaUsGb8QwpIbkhqFNhMH4DW8eAqIddJr
         50ow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180699; x=1786785499; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2Gm0lydBXMGnjaYHnDwmar3OPX3zd9bqOVMn0dSuwQ=;
        b=cMcJOB93OnDbnwnu35Y6UJ+5RqRe+34+oPI8M8aaFt0AYzL6nTlj09D2aYlmbXezuH
         2T7/uvc1Mtx+JwV9FMU8WuZ5cW5j2czNCiiKPdnCPu6tQSzcmeMGcjkkNaA8kT+28re5
         L31n/A3TCqRqmsch3OurVcWxHuRHY98KDjEuFhtvnuVt0fm4dkqOWNHLIBbMuA6Z7iaA
         sZ/Kku43taSTrSxdChPgAe+OhGHi9Oc8yBGH4gZXQcnOBo7lLLo7YTpMMsAyXilVgawg
         hHfrPQvQXzwl7RivvhGx/JpSHfbnyj7pxia5SJvFuEscpmH4TDqOcY/0C2WsfInALIht
         F5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180699; x=1786785499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2Gm0lydBXMGnjaYHnDwmar3OPX3zd9bqOVMn0dSuwQ=;
        b=IwqZsNDfGQdYeGgTsK+GB++KvvCgU/3OWtzvZK6FhxWs3tpcvcEqaBDwWbEmXQRMah
         rHF+iWEHRZyirHsvpOjjNjbKUPii1CDqzfrsyTmWyWda1umGWk3HCTxFRSCnavbMc77k
         +BkgJd89RnKctOd55OYu0qIVaTOo108czVlxPd18uW34AgeoJ/3jnYLaPV3mg5APnTtH
         HcgFQ7SO8/uUCb3V8mqkqqQYw2rwvnH+aGMvdTbGIWUcpV+mfd9I3xJmKhxKb5YZYTYz
         iBWecZLNuUVic5SDAzMPAqYsLFN5uuglqueWz5FWOuAreFFARv7L2kyAOtirUsxRyrUf
         HDkg==
X-Gm-Message-State: AOJu0YxZkx3t3X1ZFvlscRqHvS6vrfT3md/fQLAzJ+SaS3e3+cuP59NP
	Dscd1n/Og1WS5YQQ/wRIO7qx5rfZNV6/+dyTxpoRfMvW2DVchZFTMbS6t52szARy0r85rxTd5jZ
	MkcxxVu62qfRjqHzNAijj6YFpk5xKflbEMlT7
X-Gm-Gg: AR+sD12qDFTnAz7mh6kXppsK+74Xj3r27wIaBxWmdlyXlOHheKQq3dHKaswC51ONSzx
	oddaP63FZxpBBmHD9Xdia4H3XHjDcmv/vjBRTGSejY8UIUN5XBvRH9KhV/X8q91CnHUXkD5ejGY
	uNF/H5nFt3bHZmxxeMid2fQsA3OctNX2dWU3S3uLws2zAUEmr1jSKqckr9qzaJ54Hui1gsGhwLk
	qNnCosbHnwVpyFQJHqnZptnNjdI4Y6SQsgPQ7I1cQwUUJC20onAofRDBdggU1n20EP/RKSeHjVs
	/0EDVU757ObpCrHqKkGnBoyQDyblwhWBGneDolzcbgA0f9yLMv5+CS88qmOw7PEDGfoIK4VelPF
	+w7c0D9vZxgThlhSmpZZW6lxNUpbgarof02ZMlfv9D/+F8wZx+z1iFYrcFfrCSxeG8X+RW7N1KN
	4ztww0zVbF1Ut1QrE=
X-Received: by 2002:a17:90b:498b:b0:38e:7268:220d with SMTP id
 98e67ed59e1d1-3903c628176mr32041661a91.20.1786180699216; Sat, 08 Aug 2026
 02:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807080447.35479-1-phucduc.bui@gmail.com> <20260807081108.B61881F000E9@smtp.kernel.org>
In-Reply-To: <20260807081108.B61881F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:18:05 +0700
X-Gm-Features: AUfX_mxfRZ37adEsr__Kei-3RDXP-Ih44Ezf0uyFTi5c3Qi7vZxT0rKFB3jsFYA
Message-ID: <CAABR9nH9w=q4cqokrGOE53ZaZhx4=AFyXrup4CdgF9LZyV=QaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] watchdog: orion_wdt: Propagate errors from
 optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Does this early return bypass the clock cleanup?
>
> Earlier in orion_wdt_probe(), the hardware clock is initialized and enabled by
> dev->data->clock_init(pdev, dev). The other error paths in this function jump
> to the disable_clk label to clean it up.
>
> If we return directly here when an error like -EPROBE_DEFER occurs, it appears
> we might leak the hardware clock reference and its enablement state because we
> bypass clk_disable_unprepare() and clk_put() in the disable_clk error path.
> This could lead to repeated resource leaks if probe deferral happens multiple
> times.
>
> Should this use goto disable_clk instead of returning directly?
>

I agree that this makes sense. I'll make the change and send v3.
