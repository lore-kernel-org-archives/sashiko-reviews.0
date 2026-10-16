Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5F3D73
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108839; cv=none; b=VfOnJht4BzoVyOfEGFvyH07upmB7y61XnNwNY7+gEGAlY1SNzOLp4sjTxsWuGUUXrxVR3fnOFd0Jve7WkB5GvHdpSFYRJ62wuw2wgqGMZiJl1Po/NKT8Jj2TfFle8Lh0EvJ2Gy4UaebMZS69cRRLC2ReHpo9yu3uKq3iNfvoMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108839; c=relaxed/simple;
	bh=wZY6R6h+1FTYsiykK/FS1yir7juZ5RbueK8o7FId0VE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=SXUhOQa3geUZkuv2RLM+ZCmZ0svFH3L0/SFnebb+0Cu+MmOYeu+2ziY1M97Iz520eq7H6/O8PuieOL1rwunyJs0XeWq6gUzAx1Zd6SXekqKGnuJPWik+Fjq4T1QWmBokcFXoyzl0gdvuV2d8JJBCyIInyw+/8m//8RAslS67nsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvbUd175; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvbUd175"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-515166dfd77so2546105b6e.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 17:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792108836; x=1792713636; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNSbq9NuIFmu3RW6AfiPOpBRBrk4/5iTbAuNndz/7MI=;
        b=WvbUd1755Vi9EC/gHWiUN1D88aSOuYSrrQtgRO5Wnh7wyuHcRH5KCZW76y6IoqRzpJ
         JjxW1Y1Qkb3wb+0yBqpQbmOMLaCEfuRn5QfztBO3k/AQ79nt9meHnzeGgoWU9ZWdglyu
         xVhZJ7rSlShPyxBYOIi6C0qNR8T6Fxvhu0+483NO+PFQxxMfI1ubh9kuYpHfdW4bbctV
         UnxIA/2kqZUeNwlLD7E+HD0ieUFOeWqPvkKhAuLh9Ex1zXoX2ksL2FwcrrBlxSnFrJux
         aOqCtFa/wWclSEaLv2c+PignKqX2bvMEAY9lv0hunPAhBuqLEDYvRf4+Un3SriIo3xLw
         k2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108836; x=1792713636;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNSbq9NuIFmu3RW6AfiPOpBRBrk4/5iTbAuNndz/7MI=;
        b=uC1YvTA4Onpz9xF9vuoevb8SrEdEJ1bfsNF1KKkwygp7P9wcI9dN1DFWAN0TnIo1Vb
         6orNhvy0aLWvRNsDom7s94zhl3JNU9+IUVRI7SAD9LNmXDAX5CwV1Pk0s3X2v66kgc5u
         nqsdUXbhgoF/+1MZJVoP84Bd+7pS/BO05TKvwnbMmaN9kFaAT6e5OmJhk7uEWZiXmSeD
         L0/Fe79XavDVXIt3f8Td4CGfPqq8DSRKmg6lSYClDS8MquTlU4D+DzB23S4Adbz1ahqg
         U+VD8SIVRzU4xFyM0NSnwyNGRLs2nOy4mwzWcHR1ibUCY2SVdoCBQL+lXwG5tJ8fs4mh
         dqqw==
X-Gm-Message-State: AFq9FYJz2JU7b45ffTtidyZUNvWZDv6CBJ2Tq54aO21gECjDlt6rDdwW
	UTUK8bT2jnwMinGN9aUqz4jEN4f2a77o1ZM61wGgwZlux0IMms/ChbSFI/JNpq0f/No=
X-Gm-Gg: AYBFou0ZFxbJm/9RAibSmLD2VxXhis8fJUWFi06pUeyctd8krQiOLnxf+RiwO1PVc3q
	2BqJUJwpHMadJNnsonmJHmDMB/IokDI21OUOQEui/yO7ZCPMfvUpvoXkHACvB/ozINnuQ0+QgqM
	o+5Q0X4sbRpTcbgsA0OBM5pTdyntvpEmqOfdWpqrtcheSUgSRA518NG0GbtQ0fJU7uReeIqQf7u
	fvbmev8SMTBWevTia1kLxNv5dSuprZSBBztswBa7gnHRQ9S3+is2UaMizUKJk47CFV/Y2tvmtrs
	/BjlbSGzq/LPLIi5gAkbIdRfG5hga6vPY+X6WJ3jNF5HnSn0b7F4ABzkgngA4LtE4C9qytW0WrA
	14pg5F3EBxDT/grwsmTWVtN0BHrOFBL6fbbNizaEHOLBco0CPF6pWgpH9zRwpLRhIg0NJN1aiEe
	awDhGDM5HKCHUNaYKPKU96IYRuTszQ8fI/ykfXMG+5tTBUqjKTGlJmSEuxCw8K5NTTrgmcTufGA
	jDUEX9VN39PrOoe73wf0NZbsdw9AdMaNWyJwMaNBCZ6HAdvXmwC01XtBB6iTk4KknYKl4lpOt64
	fX1oDpFi9dSdobM=
X-Received: by 2002:a05:6808:1a19:b0:4f4:857c:98ae with SMTP id 5614622812f47-50c52470eecmr18453714b6e.11.1792108835681;
        Thu, 15 Oct 2026 17:00:35 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388a928ab3sm298777b6e.3.2026.10.15.17.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 02:00:32 +0200
Message-Id: <DM5TK898HREJ.34NDHSIUTC0M0@gmail.com>
Subject: Re: [PATCH bpf-next v3 06/15] bpf: Recognize __nullable on pointer
 members of kernel structs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261015234125.3152346-1-memxor@gmail.com>
 <20261015234125.3152346-7-memxor@gmail.com>
 <sashiko-outbox-173494@kernel.org>
In-Reply-To: <sashiko-outbox-173494@kernel.org>

On Fri Oct 16, 2026 at 1:54 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] bpf: PTR_MAYBE_NULL is lost when reading __nullable members fr=
om untrusted pointers
> --
>
> commit 6e594b49287fcdc28cc76204149bfee8d35d1dd9
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Recognize __nullable on pointer members of kernel structs
>
> This patch teaches the BPF verifier to recognize the __nullable BTF type =
tag
> on pointer members of kernel structs. It reports these as PTR_MAYBE_NULL,
> intended to force BPF programs to check them for NULL before dereferencin=
g
> them, even when read through a probed pointer.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index f143b1b18b5ca..b4d9ad3ca966b 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
>> @@ -6712,9 +6714,9 @@ static int check_ptr_to_btf_access(struct bpf_veri=
fier_env *env,
>>  			 * aggressively mark as untrusted otherwise such
>>  			 * pointers will be plain PTR_TO_BTF_ID without flags
>>  			 * and will be allowed to be passed into helpers for
>> -			 * compat reasons.
>> +			 * compat reasons. A __nullable member stays nullable.
>>  			 */
>> -			flag =3D PTR_UNTRUSTED;
>> +			flag =3D PTR_UNTRUSTED | (flag & PTR_MAYBE_NULL);
>>  		}
>
> [Severity: Medium]
> Does the untrusted pointer path just above this block also need to preser=
ve
> PTR_MAYBE_NULL?
>
> Looking at check_ptr_to_btf_access(), if the parent pointer being
> dereferenced is untrusted, the code executes this branch:
>
>     } else if (type_flag(reg->type) & PTR_UNTRUSTED) {
>         /* If this is an untrusted pointer, all pointers formed by walkin=
g it
>          * also inherit the untrusted flag.
>          */
>         flag =3D PTR_UNTRUSTED;
>
> When btf_struct_access() processes a __nullable pointer member, it sets
> PTR_MAYBE_NULL in the flag variable. However, because this assignment
> overwrites the flag entirely, the PTR_MAYBE_NULL modifier is discarded.
>
> As a result, the pointer is typed as PTR_TO_BTF_ID | PTR_UNTRUSTED withou=
t
> PTR_MAYBE_NULL. The verifier forgets that the pointer can be NULL, bypass=
ing
> the required NULL check and violating the explicit design intent describe=
d
> in the commit message.
>
> Will BPF programs be able to bypass the verifier's mandatory NULL check
> for __nullable members of untrusted pointers because of this?
>

It's not a bug but makes sense for consistency. I will follow up or fix in =
the
respin if we go that route.

>>  	} else {
>>  		/* Old compat. Deprecated */


