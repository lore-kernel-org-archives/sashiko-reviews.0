Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE03403E1
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526825; cv=none; b=ZQfVZ27BiYV45H86tyLtGCe9p9PL4s8/cKeMPE0BEhM3Tk5SUhRUyFVyDGQAUTI4tvydG/xF/uekyjEcfT7ZbYE0g6wxS5hB6UlvseE8WjmDbMYnfzxJKDQ3D8PNVptMO+JbKf2MvkqnmOcmGq/0JrkHdWlnjGB1yb1XXcfJwzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526825; c=relaxed/simple;
	bh=5MAd36KrAfWy7MmTrAdWHhIoFGpDBJNkMBUMQTl2LHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGU6xLhVIU3uGDuFFkaffNVOzudP/opQ5XTNg8S3CxdD313BoazI8py5kKU14Fg1VxoM4IbmlpoVGbXPpnvbL6rftWphcmttom8s+3FidC4m+8Ru60N8kuWeb0TQsUCi3UT5yP25VDueXf+U74cfXXA+m2dGmd3UsZmfR+ngJzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngzFDUBB; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngzFDUBB"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6689f36ae56so2017118d50.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785526823; x=1786131623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MrmHZvijAbsBM4kIIyUU8PQWNQGu2ozzMacZdGzdvKY=;
        b=ngzFDUBB86ps8RXoja8dv5agwVsedo6vesBBoVBW+lZfMpCDBpgX+LH0FsoPc7KkS7
         af/ZyL9iEV6QfB6ycAfx+wvo+7vWBCYomNKjGzYA8sZn5fhCOU/zDhsfPrZBENWKZxmy
         UU8cr7ffQ8esNQO9OJwciGHSJrWqtzDZBKMwVzP1NiLYjN6qWQeAfmiR7scKBluLnujr
         es1gwAbagIj2RUTZFCsK3j44ciLDXWa/Efc2509p+EqYasgOe2ReZD1HdMc4hRJIGDvK
         5Aw/bIi6NZ3bAlgw7PMiJTi0j4AQHjT4KoXBthG0Mi5yFX+Cwzv8d+o1ootP6XIKqhED
         7b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526823; x=1786131623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrmHZvijAbsBM4kIIyUU8PQWNQGu2ozzMacZdGzdvKY=;
        b=OMrf9UhfLycO+o2xMySSDcEM6XLjolIYbwYamI0cTGyeh2QTfeHtTUnWSoMxkwysbU
         w4mS8nd8uWbFD3Zy3B/ufWFC1d3gC+8rHmrYOsjVGJwXMAFCLJcKIwqZFD6X9zD0bx/I
         fMpPqTlVigeF6PinyY0jrJEm7VUZqdovNCqq6BJg1gTbWfsArvwXJOx7oTSQKQjDXfue
         66tQJfGpcstdMP7zQXSsVdSrfTrX34hW4htDxHPBhOFRALFGY+OoFWXWA+jq6iMFZAYW
         mptuRaiod+5VlF0MkDDShbFRICPC8hrvVuoEbM0MwxSr0XFqoWsN/qOSgD8MMVEpXGKp
         mu1w==
X-Gm-Message-State: AOJu0YwhJ1lJFBXoQKCjjdPqYYS29oyrCwKnwnkeKK/KVgWAkienupCL
	8eXtNrYvtX8e9UZ+F+056PP1f5AFAOSeu9JQe9n+9oIy9NfqwRWTbb+aWjy2C54v
X-Gm-Gg: AR+sD12cZDqbZrEtfxl8zYe/fQB3IQ+j7Q1NdCFPpQQbT/R+c2+F5eMPK5fuE9vuRCu
	3zjIBNyAMgTDFFQjG1EBH4BE/SP1oI4mdXiiPEqDDbAyw3bHZ5KiccowqYauesX/WTYTFcDWvxU
	GxPUx1XIOz4R5hMZFkZg9LLJEV1RlWUhsIAswo/fZ8TQfEpTKyLv+YbTaM0QdTz/AM1ChmPUBir
	GoeJwONaJBVfHcQq9UuZ7mDxsp6/b9Eo3OGfxw6gT10L0Jf8NQo9lbdZPRFyBtCVvgk/LPqSiPn
	gczV3YMK6TgjIyQ2HAEAwmMj1lvLwiXlpQXFP6T61bPDIQAEppP8K9QLcL1T/smsqieMVZyxv8G
	Eaga4hn36pQKrY16Ro0yuHjU/4c1u02fMvegJv5g+6JKSU+JkJLRgbVrMeYOc2EIJc2udoDq8EH
	f5RUx5coGJwLMl7JknHkJhDJEeXA47cmUEKShy0KPYfre7KPYTkugLLmJjCkWPSwl5VUQ4BxRgd
	usgBzKqc/y6vyhgALRLWA==
X-Received: by 2002:a05:690e:edd:b0:664:7d5d:4390 with SMTP id 956f58d0204a3-6694efcd4e1mr1211866d50.1.1785526822618;
        Fri, 31 Jul 2026 12:40:22 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:d52:64e9:32ac:b832])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948e5ee60sm1175497d50.8.2026.07.31.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:40:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:40:21 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 10/13] bpf: Add the bpf_landlock_restrict_binprm
 kfunc
Message-ID: <amz2tVz-P5Hrwm5B@zenbox>
References: <20260731022047.189137-1-utilityemal77@gmail.com>
 <20260731022047.189137-11-utilityemal77@gmail.com>
 <20260731024637.9D4E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731024637.9D4E81F000E9@smtp.kernel.org>

On Fri, Jul 31, 2026 at 02:46:37AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Multiple calls to bpf_landlock_restrict_binprm() do not compose; a later call replaces a previously staged restriction instead of intersecting it, violating BPF LSM composition principles.
> - [Medium] bpf_landlock_kfunc_filter incorrectly restricts the release kfunc bpf_landlock_put_ruleset to only the two bprm sleepable hooks, violating the stated design and preventing valid reference cleanup in other LSM hooks.
> 
> [Severity: High]
> Does replacing instead of intersecting the ruleset break the BPF LSM
> composition principles?
> 
> If multiple BPF LSM programs are attached to the same hook, a later call to
> bpf_landlock_restrict_binprm() replaces a previously staged restriction
> rather than layering or intersecting it.
> 
> This allows a subsequent program to completely bypass and discard the security
> policy enforced by an earlier program.
>

It was agreed upon here [1] that it's better to just replace the domain
rather than allowing multiple calls to this function to build a
multi-layer domain. Merging staged domains creates issues of running
into the maximum layers and introduces unecessary complexity.

As for multiple BPF LSM programs trying to overwrite eachother's rulesets:
that's nonesense. There is no security boundary broken here. The ruleset
composition should happen in userspace before this kfunc ever
gets called. Pathological BPF programs are not part of the threat model.

Justin

[1] https://github.com/landlock-lsm/linux/issues/56#issuecomment-4825919649

> > +}
> > +
> 
> [ ... ]
