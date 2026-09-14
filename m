Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D727F4825C2
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408020; cv=none; b=nkrdCixGEh6i9Z5uaFya1AOmL1yoOFPql4CNjj6PKwEA03DKVjTT50oujab5Jxl0XwcFNZzOxEZrbGrIr198uKAiASCwGxfS0vyM6sW213yoeibrIKK6sleI/orRLd1nki2X+eqp4Qc8qU9KIHaXyRPJZg6ShBsj/r+nfDgYX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408020; c=relaxed/simple;
	bh=WSfODTiWoc3NsQ0K1W4/ZLgkIxuHZ+M/l+wBk4Q09Lk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6jMJd+50mnBmsmmMdM1ih8d4OVgCFE3xEYuHQbx0wt7B1mFdOkj0XSzLViIVWtJHMWaWP9RXJL85V+oFBKm0j4nPhzQUlAMwOk5I5scHfA5BfOHaTQMRjdPo4SLAjQtLdOuLRTWg+hQuj5ngsS+ZyPsEVyyGK/78UdfxZ0Krfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQppX8Ke; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQppX8Ke"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1720894a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789408018; x=1790012818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKqIsTiqCr2Rj37ZsJNqBA0JRDoXX2ERq8ueatT/jmg=;
        b=AQppX8Ked4cWZ922PA4oU9AfCeV8upxaQ3hBVchNW9tE/TnA/XndPRrt1UKYdKbBut
         YpB2wT6t2V/vQ3s6jxCKv02mT2Q+mwQgOvxVYMB9cih0QsSk9M26BV8IAvBn0S+QXz9g
         AspFbyfk0fVnsRAtXcKjlNbDuZTGtFYBfPJUsPhldlZE0EAFgEjYMpIL7jReT1sSS8Tl
         0GOmKqZ1IBWTzO7qdZYkuxR66ptcNa50+7kyzsqIF7wJJpD4j82ub20pTiYj9OWO8j5d
         66HJEYTRVAhZ1+nWoa+POY3W24jdgkiGflCp091QMXpDOKQNVm/YXFN6IjHVAwLcgQwG
         B3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408018; x=1790012818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKqIsTiqCr2Rj37ZsJNqBA0JRDoXX2ERq8ueatT/jmg=;
        b=iotRHf4MC4KbkD1RNvpkeb8FKg58K8Mn7ZAZNtpT2x8GlB/QUvbrhc12w4wPaL3Tsb
         PXD9gmUAiBLKXqONJg0uljbooMDScY66ffqyLN5q0GdkJhGc9BnHih81UNiX8pDtlY81
         6XALBbtR+HhEMz/JFuq4SId+jnnJZbF4EtCWx1bLODZDvB3miZtSml4gqDvg/D1cZxKL
         HoU4aGf0e/AO4uAc/k++CwDefMR9FQVzCCvc8+aep/OTF8qwk8u/rgIzvsb1zjrJ55yz
         DJ+JF0pBsrWp1DlQYCnc0RJmORcY4iZDpLJQ/lvKrY2zLrfRxL4z9fMFer5NMPGlkFWL
         hlQA==
X-Forwarded-Encrypted: i=1; AKwUvBzn0dX+TtNQD1JOaAxxxn9CosNfg7AX/DyHz1FgIy5ZlHIgjcNFPg3Mtjewn7GeVoj2zN9/nPpmuxoccORhHJ8=@lists.linux.dev
X-Gm-Message-State: AFuF++l1CmQZo2ydBZf+jpKSah3lFQ/cWN9xKp9E8+KsvghTMPZYPRP2
	4Cp1QLSc0oUZtaz0I54XTbyLgqUgyLQgE+YkDeLXco52ZIm8fgugexAqZdUMk9ug
X-Gm-Gg: AYBFou2OYt1DBlztZ4IHDHwZgp5Do8yw7CsFHVHcSNruWgA0DdDbSeNzHCUCb9vsL9r
	8F1mjfbZEox4nzAC2TZXOukYNiixpyq414Bb5DykRA784cXZ18++BZV4oUbLftTPugamLEBRQOO
	0o/vQWjCNCTNxf6ugBElQWwdBICZIojpPFarEZDIXXbHwofbzAaho9C3ymzYFVKFg/YeBa4tmlX
	Umo1HkdBd4MQ+pSzAbMFjD9BMQHa9Na65SiCjqhgmz21+nqArx7qURTxaGbrna3mIw70JFlIz+w
	zCSBVFaTxXXZutwyTNE2iXrsjqLOiarxDH/Twc6CxQFmb+JlkFZ/Cx4L+h9U2Zm5KES3QY0Zl5E
	B8Coz2ogXxHWgUNbTMxTo/KFAYudolIvvhOt29+mqjMnlrAFeKKlS2FUaRHkZ+WpVq2r5CnxWsV
	rmsM3QRWlAGbv7VuJRjXn+cWB/KzuRTY97FeIZrwUJDasOIWQTLfmHTPfVdWgaUZmNzKzYFDwq9
	uMzEg4bGEtUxWHHmKOg/NiCGA==
X-Received: by 2002:a17:90b:3812:b0:39d:fe64:5732 with SMTP id 98e67ed59e1d1-39dfe646221mr594365a91.2.1789408017739;
        Mon, 14 Sep 2026 10:46:57 -0700 (PDT)
Received: from cxlqual ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9badb6sm590558a91.2.2026.09.14.10.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:46:57 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Tue, 15 Sep 2026 02:48:10 +0900
To: Gregory Price <gourry@gourry.net>
Cc: Anisa Su <anisa.su887@gmail.com>, sashiko-reviews@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [RESEND PATCH v13 6/8] cxl/mem: Configure dynamic capacity
 interrupts
Message-ID: <aqgzWnDw5trAaHzU@cxlqual>
References: <20260908102124.2231730-2-anisa.su@samsung.com>
 <20260908102124.2231730-8-anisa.su@samsung.com>
 <20260908104327.DF5E61F00A3A@smtp.kernel.org>
 <aqRuYaUt9qAvPA3W@cxlqual>
 <aqSX3OadID0REQps@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqSX3OadID0REQps@gourry-fedora-PF4VCD3F>

On Fri, Sep 11, 2026 at 08:09:13PM -0400, Gregory Price wrote:
> On Sat, Sep 12, 2026 at 06:10:57AM +0900, Anisa Su wrote:
> > On Tue, Sep 08, 2026 at 10:43:27AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > 
> > > Pre-existing issues:
> > > - [High] If a CXL device is surprise-removed or a fatal PCIe error occurs, `cxl_event_thread` enters an infinite loop, pegging the CPU at 100% and deadlocking device removal.
> > > --
> > Surpise removal is unsupported. Jonathan mentioned the same on a similar
> > thread: 
> > https://lore.kernel.org/linux-cxl/aqLZP3ORYzCLfSgR@acer-nitro-anv15-41/T/#m8e12567a42b07fae8aa307406e6e017fe24ad832
> 
> This has been my favorite sashiko response so far
> 
> "If memory is surprised-removed, the system deadlocks!"
> 
> lol.
> 
I was just happy to see it only found 1 thing to complain about this
time. Music to my eyes

> (your series is great, sorry i haven't gotten around to reviewing it
> properly, i appreciate the doc updates very much)
> 
No worries, picked up some minor changes from Jonathan and Davidlohr, so there
will be a next rev anyway.

> ~Gregory
