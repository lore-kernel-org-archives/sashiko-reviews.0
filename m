Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667F349B0D
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525904; cv=none; b=MIqz2fbl8Uas3Q8UJLu8fegX8fBjPFnfubVN+xuY7FME1SwQUT12Qj03NnZ70puRoNV93GS7kfgI+HXVlCKcoj8cSbEMfktFhiuzPsnEADCBn9STeZKCUIA+JGkiua/LwWv3/J5Xx3L+M6xWD7lQvYe46eW8ErGlI3ZzpvQhKMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525904; c=relaxed/simple;
	bh=+236ZUiGE1UTZf5D568G34CzbrXLYB0nlzUL2poy9i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8u7Pq41JYwVnFDuu7gB0hrbqoCmQdQKOEwNKfki5SdwbtcH5H9fpUc+yOxSxinmX4d0pXDeRHkwUWaodvIXFng9aHCx0jeAxdbDorMXu/Wbeh+MBhr4cq5NeOF8TVhDqD7R4qsOku0lS5HqYgMJlCMr6bnQyJK3ZRszDDmEcxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMJZHj3g; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMJZHj3g"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8114a4542b2so21211707b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785525902; x=1786130702; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w94Tr21pSE0EfOV5IzEh1sDDQbxXsJWYMJqC312JyA=;
        b=rMJZHj3gUOqWq8I1rYGQZCipSWEUCYxcHdHhr7qOpb1K4WeFCWLzRE9y2ODgyXAN3p
         HCBSDxHSJp/eEVKL/eo+wI/3GsKaE0Xq3Z+XTQvG410QzUMvTIl2zBvAAn1W4+Vgur51
         ZxK0ajaYG3YbF3Wf3wrV+P1ickS0m8fCOSfJQkBUfuotqn9qgLO5QYle4oWLeWHgxAQY
         MafyMGwizEouyG2tGcJZXLVAR6VC8sBAjJ/qz6i9CRe9YVPpYGsfcD568C7tdMsOjbfB
         sv+qE77ymBXOb+mdySIc/Ux49WkWIGh4dMpvUSXtgQX132D+iGWLGwuJ7uAYIUhx89ae
         PxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785525902; x=1786130702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1w94Tr21pSE0EfOV5IzEh1sDDQbxXsJWYMJqC312JyA=;
        b=o7p66H3NHxIXZAs/KCKK8sdcv+HULVuxoJcBbmwOJ18PwIJvr4+tRAWXbm9u199gKQ
         b6okeDHtZL5kvoGWTMQFmhlA7/8Cu1BoZBvREW+QIRoONMnY7axWqOeq9KvqHSpM+XZ7
         BTespqfda//tSkxixhDocJ55vXnpqx4wvbbzsML5Be6+uZv4CblEhWe7bibKJOZl7owN
         zRaoxizHOLDWXAVzIwZnB/Z6ro6N4MtB6t/QrYSOEEHYkUHE3oFpyRY2kPUC3N1UhYTY
         Fh1xdqwKGxSkbaQrJeprt6Dntyylzly8tvtJ1arxj1QyoxaLL8S/ETgKe4ergH8D1Vf8
         FeEA==
X-Gm-Message-State: AOJu0YwNAZpIshYGMe5UAcYv7lLHYzhnhdaOKfEQHOteO3RQXHcKfZwY
	Lzwp/rBCL/9ZAPaP+3Kfiyv3jCOlAghGMEXM7wUXBwfb15p1Di1rYVktdxtMn8Jn
X-Gm-Gg: AR+sD11Ab5KV+w7MywJBknGVSSKspqSsbblQjkYdNKApMKqiMrVguJnDSi+zXxPZiyW
	i37M0XZE2Amrn7geLcKztKfTTlyuzSVYdJGmcmWIITbe1wHgb+fTNRftxK3II++Qc5NuEVxWnPc
	+QjIOf1mCmctjPqjX55rA+xJuPsGlWoxYfet9rW8N+W9/epzxR/Lh7jjjTtelA5qiL1p+73b73c
	n8tlHZrShn0UxkJxUInUAwQJnKsQl+WN/rBxSbLewvum8u3umSguABgOHfwK2TilwJvwaBHQpPM
	vm7Tu9EPDWfSWccYCtdrfZsWEx2UwmsCVeG8e9rHaGqBeqdOLXxj3dYpwwEWZGUlfN8DGqEtRYo
	LO+8nEABMI15bgVh+A0q/+aZX8Niqqm+AKnVaX3PtYxaNGXVR+5f0Hw5fKkO1E9MVklLiMV8Vq4
	i64g8nQxjHjAuKu58jnrNiNojXsPO9CmeVL+2h8XjwAryV6w03f2PC5uQ8LivCXYtnRPhTJHXgq
	FtoKv0v4/ZHnYjsiKcoA6Q=
X-Received: by 2002:a05:690c:6d0b:b0:7fd:ddb0:2622 with SMTP id 00721157ae682-81fd49bfea7mr14802447b3.6.1785525902064;
        Fri, 31 Jul 2026 12:25:02 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:d52:64e9:32ac:b832])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf30319sm13142527b3.6.2026.07.31.12.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:25:01 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:25:01 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 12/13] landlock: Document the BPF kfunc interface
Message-ID: <amzzYACkhCpraJLO@zenbox>
References: <20260731022047.189137-1-utilityemal77@gmail.com>
 <20260731022047.189137-13-utilityemal77@gmail.com>
 <20260731024550.A713C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731024550.A713C1F000E9@smtp.kernel.org>

On Fri, Jul 31, 2026 at 02:45:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The kfunc filter excessively restricts `bpf_landlock_put_ruleset`, contradicting the documented intent and severely limiting ruleset lifecycle management.
>
> [...]
>
> [Severity: Medium]
> Does the kfunc filter excessively restrict bpf_landlock_put_ruleset,
> contradicting the documented intent?
> 
> Looking at bpf_landlock_kfunc_filter() in kernel/bpf/bpf_lsm.c, it appears
> to apply -EACCES to bpf_landlock_put_ruleset for most program types and hooks:
> 
> kernel/bpf/bpf_lsm.c:bpf_landlock_kfunc_filter() {
> 	if (!btf_id_set8_contains(&bpf_landlock_kfunc_ids, kfunc_id))
> 		return 0;
> 
> 	switch (prog->type) {
> // ...
> 	case BPF_PROG_TYPE_LSM:
> // ...
> 		if (!btf_id_set_contains(&bpf_landlock_kfunc_hooks,
> 					 prog->aux->attach_btf_id))
> 			return -EACCES;
> 
> 		return 0;
> 	default:
> 		return -EACCES;
> 	}
> }
> 
> This prevents BPF programs of types other than SYSCALL or two specific
> sleepable LSM hooks from legitimately dropping a reference to a
> bpf_landlock_ruleset they acquire from a map via bpf_kptr_xchg().
> 
> The verifier forces the program to drop the acquired reference, but rejects
> the call to bpf_landlock_put_ruleset().
> 
> Additionally, looking at bpf_landlock_kfunc_ids:
> 
> kernel/bpf/bpf_lsm.c:
> BTF_ID_FLAGS(func, bpf_landlock_put_ruleset, KF_RELEASE | KF_SLEEPABLE)
> 
> The KF_SLEEPABLE flag seems to prevent calling the release kfunc from
> non-sleepable programs, even though the underlying release mechanism
> (security_policy_kptr_put) is designed to support non-sleepable contexts.
> 
> Could this severely limit ruleset lifecycle management by making the kptr
> functionally unusable across most BPF program types?
>
Sashiko repeated this same feedback a few times.

It seems reasonable.

I don't see why the bpf_landlock_put_ruleset's allowed calling context
can't be broadened out.

It's probably ok to allow it for all BPF_PROG_TYPE_LSM programs
(including non-sleepable ones) in addition to BPF_PROG_TYPE_SYSCALL, and
drop KF_SLEEPABLE in accordance with the security_policy_kptr_put docs
stating that the hook consumer cannot sleep.

Same goes for the bpf_landlock_ruleset dtor.

Justin

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731022047.189137-1-utilityemal77@gmail.com?part=12
