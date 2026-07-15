Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAD2443E38
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139080; cv=none; b=ChbnAUmvAane97Fc+vP15mHS4L7eyFRPFpY0zy4zGORrmvbMxEGJry75PBE8bZRj421iwEVTOBehbyupBeZCOII02Z79vqwB11P1Xcq3JsaRruN2mCLbj7J0L4QWt0cWGlMUgBJC1FvXOY6rEy/XGbiHNoBkxdytzwFWoSXgeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139080; c=relaxed/simple;
	bh=Htkoo/9cO7CIKP0jO4iIc3KDWoevJ0e/Ac9yRQ3UJXk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZEAB59/7ukatO3W0PBR8CGugrWOGUyQrqLLaTJ5Fewv2oht3sarR0HrVZmyio/eA717st76JUeBQ8Z00TdvDd13veGW2i/NgTzY7vQIAdK76/ucILB9L/ERK2JmZXV/1BDuTZXxvy/5KKh1GNsfwaR5ymEWHuqK0HJiyFNA2Buk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fErotvuk; arc=none smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fErotvuk"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c159467cca6so130062766b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139077; x=1784743877; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HlBALkHxWRmALUuOT5uGqcGnPT4o5St+F0S3DDKC6sQ=;
        b=fErotvukgDuxVYec2LQTRo/4SMQ3/nn/X8Yd5AF3TAY0oB+R7/V88d5PobMJ2bjy5d
         QnO6AVmQNfMw/RboGw+twiD05jo1ZMiwmOMfBCcYZWcjgWmU1sF9aCJaBOM14pG2/NmN
         x9MBqsCAXqLrotWyv6zoPwo/aeP0XrzCjIiBTOM+fQPEx/A+BUI8sXCmeAuoma/vfd1l
         vwyxs2HJpB7GTnrpZt/86hB9zUO+YfxRAKxk9RVuQm/9QGoTK3WhMlhSKDAfQHzuX7Br
         jUOLofwnOPxNHinfEd66h5EpSqEaLE+iEiX8UpI09HDE+0diMdZmJIKyvvsgF8zmNV6E
         QmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139077; x=1784743877;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlBALkHxWRmALUuOT5uGqcGnPT4o5St+F0S3DDKC6sQ=;
        b=bj3xwEiYyAQFWNdsHbRRE+geJyik/IRsC5Tw+73n7DJY6fLJMqaTRulHqKWE5pUEsO
         MVRQVXsnLjCFJxYjYG+kHPA8xK+LnW2cR9nJHqBTxukSwrnxH4hps9+wnsBLRD5OT912
         yVeAyqmalKNe+5GaSyJxFzC5D7XFY48Rdt+skNciL8WDwnvHDUP/7+/Y3wJ3qHdCNwyh
         W+Wi9sRhdrZBMrp0q2XJ2OlZU3tT2PhsZu0e41gKYtbwPbde6afdCEJRkBqPY1sMXoNa
         rh2XMl/0g3OfFpJnb4XOzCLXIGjq0dnazweYyZ7aVp4fuye5bq293Yl6XLKMPUIZBMLj
         QENg==
X-Gm-Message-State: AOJu0YwgJLV+ikmmOizVMuznbdtm7oMU8qSMaooOkoJGakXieCYofkLA
	/Y2cvwkw7NZPR8umGfGUxEqqUHjMTf583NG/wLcVK+EYdrQBb+lwKNvnXL4CQm+b
X-Gm-Gg: AfdE7cmNyPqFV6NPm5X5b9PszwKuRxveUW0my1btD7qO4a6u+k34WV0/kb/kIbj2Oif
	0oDUO4hhBgrgOMqb3ji/7LSOtAg2xl14e+JDAvSjg1O/jXXt86Tdq2yO9ECMLebC/GX2Y0e5ABO
	M4WGZk5CzqXybhOtSoKPrMsDmxOiSNX/gCVRGzq20SZbOjxgyUjT0cwOlJgCDSwzZLKrd/J1dCc
	9xbxTvl8GL4RDU6EVKkR9MVyUuUuCZikZg674fRXbiSfHlt5lWQFW8ntpNbonu5Mu5J4jifHjt2
	jIWGXO2gLeyfI9dplvkFv0j9nro69XljdByYBFJdWA0MPqvbI1EOyH2En+ZHC4yUijhHz5+kwOG
	v2tcEc9rzt2sYExVjaNsgkZ2manDXXiNP/qlwVAYikx43SIwVDN/PqJsiKfuyepK32asvZFIx4D
	lXMD8jP/pr5JkcI85kw8nBZpLT6BZxsWEn5rlC6I9cyAKPj9YhMoLuo1xRSnyB365hUae4ItUeU
	obHduZQgDh3SHTcg6N8s97t37rnsBIx0+xXNIXLRRnKNATb0P1TvA8=
X-Received: by 2002:a17:907:1685:b0:c16:6dac:a004 with SMTP id a640c23a62f3a-c166dacb0bbmr433642266b.24.1784139076860;
        Wed, 15 Jul 2026 11:11:16 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687170e24sm74925566b.20.2026.07.15.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 20:11:15 +0200
Message-Id: <DJZCIOHS5WIH.UOBSKB42OXMZ@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Amery Hung" <ameryhung@gmail.com>
Cc: <bpf@vger.kernel.org>, "Roman Gushchin" <roman.gushchin@linux.dev>
Subject: Re: [PATCH bpf-next v1 2/2] bpf: Zero kfunc arg meta before error
 paths can read it
X-Mailer: aerc 0.21.0
References: <20260715172127.2416388-1-ameryhung@gmail.com>
 <20260715172127.2416388-3-ameryhung@gmail.com>
 <20260715173853.886C81F00A3D@smtp.kernel.org>
In-Reply-To: <20260715173853.886C81F00A3D@smtp.kernel.org>

On Wed Jul 15, 2026 at 7:38 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] BPF kfuncs bpf_mem_cgroup_memory_events and bpf_mem_cgroup_vm_ev=
ents do not handle negative enum values, bypassing bounds checks and allowi=
ng out-of-bounds array reads.
> --
>
> --- Patch [2]: [PATCH bpf-next v1 2/2] bpf: Zero kfunc arg meta before er=
ror paths can read it ---
> commit 53f60dae3990fbb436a03cb878e7564339ccd1e9
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Zero kfunc arg meta before error paths can read it
>
> check_kfunc_call() reads meta.func_name when bpf_fetch_kfunc_arg_meta()
> returns -EACCES, but that error can come from fetch_kfunc_meta() (e.g.
> fd_array_get_btf() rejecting BTF binding for a signed program) before
> meta is memset(), leaving it uninitialized and risking a garbage deref
> in verbose().
>
> Move the memset() to the start of bpf_fetch_kfunc_arg_meta() so meta is
> zeroed on every error return. The intended "not allowed" -EACCES path
> still sets func_name first, so its message is unchanged.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index c87e5fec5a857..ddfa4f57016b7 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> [Severity: High]
> This isn't a bug introduced by this patch, but this is a pre-existing iss=
ue.
> Do the bounds checks in bpf_mem_cgroup_memory_events() and
> bpf_mem_cgroup_vm_events() properly handle negative values?
>
> Since enums evaluate to signed integers in C, and the BPF verifier does
> not enforce enum ranges, a BPF program could pass a negative value to
> bpf_mem_cgroup_memory_events() in mm/bpf_memcontrol.c:
>
> 	if (unlikely(event >=3D MEMCG_NR_MEMORY_EVENTS))
> 		return (unsigned long)-1;
>
> 	return atomic_long_read(&memcg->memory_events[event]);
>
> For a negative value, the bounds check above evaluates to false, which
> allows an out-of-bounds read on the memory_events array.
>
> Can a similar out-of-bounds read happen in bpf_mem_cgroup_vm_events()?
>
> 	if (unlikely(!memcg_vm_event_item_valid(event)))
> 		return (unsigned long)-1;
>

+Cc Roman

I think we should just do:

	if (unlikely(event < 0 || !memcg_vm_event_item_valid(event)))
 		return (unsigned long)-1;

as fix?

> 	return memcg_events(memcg, event);
>
> The validation routine in mm/memcontrol.c uses the same signed comparison=
:
>
> bool memcg_vm_event_item_valid(enum vm_event_item idx)
> {
> 	if (idx >=3D NR_VM_EVENT_ITEMS)
> 		return false;
>
> 	return !BAD_STAT_IDX(memcg_events_index(idx));
> }
>
> This allows negative index values to reach memcg_events_index():
>
> static inline int memcg_events_index(enum vm_event_item idx)
> {
> 	return mem_cgroup_events_index[idx];
> }
>
> Could this allow a BPF program to read arbitrary out-of-bounds kernel mem=
ory?

