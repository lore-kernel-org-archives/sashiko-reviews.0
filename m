Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F6947CA6B
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522070; cv=none; b=Du5ZKFyJoP1uUtJfXaCeH5Q91hUCZtRjEtIgCoW8nG62i61b/B/hur6iluM4GrBlJWlI1Lax3hKwydv9+CkObUVk1jZLi92ylPkWA24JXVPZF+YOig8pujT/3CPJVq/Jgt5JY9AvmF7swA/vM5TJFUy+rEekMgYSGZTajMMxfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522070; c=relaxed/simple;
	bh=Q8HU4Dj/jZbI8IsVvRVh0PhoSicULEYOCiGQmKItAgU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Wufe3YIIqJRxYooHodrnPCGYslf5n7Gy7rtYYjAgZ0Yluh+VL/wdo96cI4n3RvONNRxlXvbZkh5pVV8x2UfmbcgPkAwvFnPuZowZKoyo3S4163BwzBZ6M6KoTPsoxfR4qts8bzwwjG4WF0LkGFO/PaBcsQZYoDGVBjtxR0e8J+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prFqTiks; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prFqTiks"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b92ccb8e0so2765305e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522066; x=1789126866; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZsQlt8wlSmLLCcmfC4UkszaLNl9vEWULZiFqjg7Do5U=;
        b=prFqTikslMmkCjWgxi5WwP7hrk0oPCNWnB/qQwwCHMuR+eCnXNtkVYYrkqDwfHU6Ux
         IGDS52FuZ3NuJG45gxCx7BTkJeZDifh+ne8KbjvBeJMkvdFy5Ms7NFTEZicNyXfbgNCG
         Pig2pqwtuMtwijBMI6Hz3oRwIet7uFpUdPYXx+wZVQLw27tTQg0iraiVOQPY1WxCTlma
         qo9Djxt6G0lllj1s5ghlYoZ1gSCXj2iR50FjBOimOwVZ14q9Bqv06lMALekPoSrdBFPD
         jOYKde9/Qm2NIcnFektNWB+H4aIzJPAhXwBZydV0MDCa5EU64onxmHXbeZLP8oIzgajk
         2pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522066; x=1789126866;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsQlt8wlSmLLCcmfC4UkszaLNl9vEWULZiFqjg7Do5U=;
        b=OAgNTRHSkiU9TmelWZWOqYqKUUubXiiJ/i2kOFbix11Cn+UceE4XAFCQVnqE04Ko51
         jKBCSZMwqsXrG074rKN+Zxuo19PyBux9U1pfhjuM+TUb1VoIzTEBXN/ms2xTJeoP/ejc
         vCsXMRv4SLxkQZn7wLvsSfuFz83lFJSEEBu3YDIQJu8xPjI0A1N27hIWgLmSjrF2qGy2
         5w3FwvLQfJFvvFH/IUgKoIbgePjEQZSz3iZCMEKgD2URfKxUriqgcsV0Xqq5Cd6vNJRy
         QzbhhT08g5xargAbFeSCPDYQB7b5c4We3lr6tsUgm6tBdc9MWg4lAo2Y/4asqTeO6aSR
         xqKQ==
X-Gm-Message-State: AFuF++lnZCuuwBmEpVP0RrpdsTc6Qa9dss1Tl3/B/+GdlP2oA3QZR7Av
	F3+rlrYd/IT/oY4EFYtoEZB7LMvbOOaAHYTgFBNarAxfMTmUVtzmKB7ruwawMGri
X-Gm-Gg: AYBFou2qGd3iV4IEdyyiKhBDYoUtCBkHZhnCwELLB/MkeBK3vmGkmuPIqq18xWh/zgS
	1IhuhjS2ffJOhDzQa/mfm8V0c+4bfPuU2rrhzorkdhYMesm4BWeLC5dfyyUaJSTlgLAdS34TLXg
	2WcR+DXyDFk6eTOEcROHhWDXNJNveppJ5SQZ1xTk5D3IZ/Lm7txOMqbFfOuYabK8+x+n1toy/wP
	cImODY59c+s7Izn0mi4V0uLg+gIa90x+QtJp00Bp+rSNCQ5GHVMy4+o9NmBWITYHMjV8oJrSC1z
	2Nd7tgyeRF/ak20giD5tCs9+eoLZOzlB5PI6sUDVWvNCbgPxzxC291RYi0fZD6hnQXxNsOoN3k/
	HfonglaD5zjCeY0vcec2nyI7lgKfmQ1B3JuG+YTfw0b0zHYOI3NfzOGVrEh+cpRkRYkiCcN6qn/
	atdTkyQO6IOyBGCJZ3PcufLok8dgjpUpdOYFaq3d0bXUko9h4vfs7hhEOlp5I2XM+BzhB7ejbqQ
	OMKWaRbhRgXc1lsMNQ5shRuAyU7e+S+nEDiM/NOOB1xbcbY8P/xXADejKLanTguVz3JD4+AZOIB
	Y9emJzWcyk8RjVc8dAA6tRBdUYQ=
X-Received: by 2002:a05:600c:a05:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49cfc6ea772mr26999985e9.27.1788522066073;
        Fri, 04 Sep 2026 04:41:06 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm35649685e9.3.2026.09.04.04.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 13:41:05 +0200
Message-Id: <DL6I5PYM23L1.MZTSPKRDHLOI@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 3/8] bpf: Cancel special fields when recycling
 rhtab elements
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260904104203.345917-1-memxor@gmail.com>
 <20260904104203.345917-4-memxor@gmail.com>
 <20260904113744.BE0BB1F00A3D@smtp.kernel.org>
In-Reply-To: <20260904113744.BE0BB1F00A3D@smtp.kernel.org>

On Fri Sep 4, 2026 at 1:37 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Replacing bpf_obj_free_fields() with bpf_obj_cancel_fields() dur=
ing map updates and deletions violates BTF-001 and causes cross-key resourc=
e leakage.
> --
>
> commit 87b60bb947c49832ff2d2552730fd3c5124e6130
> Author: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
>
> bpf: Cancel special fields when recycling rhtab elements
>
> This commit modifies rhtab map operations to use bpf_obj_cancel_fields()
> instead of bpf_obj_free_fields() when replacing or deleting elements. Thi=
s is
> done to avoid releasing referenced kptrs and other complex fields in NMI
> context, aligning with array and hash map behavior.
>
>> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
>> index 527cc5716ee8c..cc60e99ffbe92 100644
>> --- a/kernel/bpf/hashtab.c
>> +++ b/kernel/bpf/hashtab.c
>
> [ ... ]
>
>> @@ -2967,8 +2957,8 @@ static int rhtab_delete_elem(struct bpf_rhtab *rht=
ab, struct rhtab_elem *elem, v
>>  		rhtab_read_elem_value(&rhtab->map, copy, elem, flags);
>>  		check_and_init_map_value(&rhtab->map, copy);
>>  	}
>> -	/* Release internal structs: kptr, bpf_timer, task_work, wq */
>> -	rhtab_check_and_free_fields(rhtab, elem);
>> +	bpf_obj_cancel_fields(&rhtab->map,
>> +			      rhtab_elem_value(elem, rhtab->map.key_size));
>>  	bpf_mem_cache_free_rcu(&rhtab->ma, elem);
>
> [Severity: High]
> Does changing this to bpf_obj_cancel_fields() leave stale special fields =
in
> the memory cache?
>
> Since bpf_obj_cancel_fields() does not drop kptrs or list heads, these
> references appear to remain in the element when it is freed to the cache.
> When a new element is later allocated from the cache in
> rhtab_map_update_elem():
>
>     elem =3D bpf_mem_cache_alloc(&rhtab->ma);
>     if (!elem)
>         return -ENOMEM;
>     memcpy(elem->data, key, map->key_size);
>     copy_map_value(map, rhtab_elem_value(elem, map->key_size), value);
>
> Because bpf_mem_cache_alloc() does not zero memory and copy_map_value()
> skips special fields, will this cause the new key to inherit the old key'=
s
> populated list head or kptr?
>
>>  	return 0;
>>  }
>
> [ ... ]
>
>> @@ -3029,7 +3018,7 @@ static long rhtab_map_update_existing(struct bpf_m=
ap *map, struct rhtab_elem *el
>>  	 * kptrs/etc. still sit in the slot. Cancel them after the copy
>>  	 * to match arraymap's update semantics.
>>  	 */
>> -	rhtab_check_and_free_fields(rhtab, elem);
>> +	bpf_obj_cancel_fields(map, old_val);
>
> [Severity: High]
> Does replacing the free operation with bpf_obj_cancel_fields() here viola=
te
> the requirement to clean up special BTF fields during map updates?
>
> When overwriting an existing map value in-place, failing to free existing
> kptrs or list heads seems like it causes them to outlive the update. Will
> this leave stale resources bound to the key indefinitely?
>

Both are deliberate changes.

>>  	return 0;
>>  }

