Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36B32ED40
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 05:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290756; cv=none; b=WPku2KG/p/TizHLUKSN7sWC4eNdu2Jacd9TymkBo3OeD1jT72TbE3CFuD5UBTK223RPB+TQmDpjLRUUdXRMnCQmVwMhLD2/lCIwYOkG/Yoq0pkCk4wyIY6gkDF9tMAGj/eUKG8UeD/8D+d72GFRz9/WNNzv52mSGzCsDkgggADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290756; c=relaxed/simple;
	bh=XmhDK51YRFElty/rO3pIPdGXO+f8DTlNcu/OqQ7qtfM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=bgI6Jhkn0g8QiYIUA0h907KFU9FNj9/sZk5LALBrTX5v7s+9oX1j0OIpRyaBT25T68unDsmZ9qyto4SG/87Sr+GmqfS7VmZrSvQzwIZ2EPGSu7YTMTcOkiy8ctmLRMm6bpXlJNis68eIaz4m/TJRrj7GUVLCR9/SPpMbsKe0ZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=Z3MChZDC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="Z3MChZDC"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso1605777a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 22:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780290754; x=1780895554; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1zbtsLwxCk4NWx2zYKtuqmwSI4YMlF09y9CSbk+dJ0=;
        b=Z3MChZDCVS6ayoGk6GI3vt8m7xhnBZ6ZI+xSBLYBcscMUGwKzb5Yu8fOrWzyuLpD80
         6ghYHJOkLc72XFYSD+75Bao/oCGPuIuax97r4rNTkglzwMvT+az/WFTWK2X7KSraS4yN
         VbNX2HN9HsFG5krDfH1gJIkUx6wWNcWyaut4wFCAorIICdD2t4Q3liy+tYRPpDZQGswH
         attKJgSm1iO9TeD2243Cj943Rn7eph42dH1AV6w9XXLUZBdHwjNnsvvLCBLfROidDyIM
         MIwpsF+WkR4QffWxYZqC7L5ITnlKkYXqdwml3QtYK1BjtVJ/TCwNffkiFG0hUY8rwRhD
         9OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290754; x=1780895554;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1zbtsLwxCk4NWx2zYKtuqmwSI4YMlF09y9CSbk+dJ0=;
        b=UFPezBIc/leKWyw0nimPERww3OduwOse4cJBv1Rdpp0Jn7lQBwMXWqWmVkhxLMsDyl
         Y80SbpyTjSn6QnZfBVKPA3t/a3x+lwAUJCk8xiO1OXQvi0Fffhhnlx6jkXoLxvI2ia0K
         Ek3fmuW4nmqQ1E7WUMHkIkgXr7QY6XSPUd+2EfDxuQ+aSKZ3WMb/GfDZQeeN8jToukxE
         Cm7wmZ1ABsnJjPEFfB9Gc82MqEkYP7n/Wa5t7NYOdm/olZV2uFEl5C8AtKsaUFUgSf7z
         D02gy4LaXauKnf+fMSBebMbwAUy8mu3o1v0F6pgHO5Qwv98hW/qYOXZPwExhabxkJ7T9
         oqxA==
X-Gm-Message-State: AOJu0YzeVCFZq88GtpwmFHUhDufPBlVXJlP5wZOFY0v/8FdcIO02M0qZ
	B+mMyw2vWgxIkqImScWhtxXg6fJb88k62NU68L+iaj1XNBnjlmbSFrpi6PudzA99fAAgw1Uw4wg
	0tJJgFuNQiw==
X-Gm-Gg: Acq92OGCi7ZBODwKl3L0I+FnA8sFInyosdJ037w+hltj/mVMytBn0fyeb2Oa6EatFeI
	ry4B3/kMzAjZRO9jPxcE3hzvIcon3LlQHuz9K0TzbJkiMdN6lMB1ft/o8izkiD/dFjw2w8Z+Nlt
	Nvh/E90uz9vOo2BY3pXRoFMo8ZTb1Czaf90roQOwDxYEppTx8BrySsR0FFBgMy7n9xMQC1ueSH+
	J18gyF7X287CE6BuNYXq2rXg2NTjaI8Z413UCFH/0A2jhtfJpzxXp6n42bgQop3pz+pYV8IlNXA
	tkVCt314DyADysv1RIw/i3l07dfC7C0j3ULuRrP0T1Pmnvz/RUBhzudo08kfG9wWXaKb1HKSiMx
	lMOwzS2mJFwf3gWZ7i4krQI/W3xzXGzmNTrh8PDcAONR38YaGCS5pPUa8HEmyprTh4pMjsgh84n
	jTs3z+4rIyddM1PCGAUN2kMtSAGnM9mKDX0o8=
X-Received: by 2002:a17:90b:2ec3:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36c4ff277femr8565583a91.8.1780290753925;
        Sun, 31 May 2026 22:12:33 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbfc971c8sm9240159a91.3.2026.05.31.22.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 01:12:32 -0400
Message-Id: <DIXGEH7ZJMH5.1QKUUBCNKPVID@etsalapatis.com>
Subject: Re: [PATCH bpf-next v2 2/5] verifier: parse BTF type tags for
 function arguments
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530002259.4505-3-emil@etsalapatis.com>
 <20260530005922.90CEE1F00893@smtp.kernel.org>
In-Reply-To: <20260530005922.90CEE1F00893@smtp.kernel.org>

On Fri May 29, 2026 at 8:59 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] btf_scan_type_tags incorrectly rejects valid BPF programs contai=
ning unrecognized type tags (e.g., __user, __rcu) by returning -EOPNOTSUPP.
> - [High] btf_scan_type_tags fails to discover valid type tags if they are=
 separated from the pointer by other BTF modifiers (like CONST, VOLATILE, o=
r TYPEDEF).
> --
>
> commit c938604636d812339744a9ba91c4659c3d79392c
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> verifier: parse BTF type tags for function arguments
>
> This patch extracts BTF decl tag parsing into a new function and
> introduces type tag parsing for function arguments, specifically
> looking for the arena type tag on pointers.
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index 17d4ab0a82068..c6a930aca67ec 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
>> +static int btf_scan_type_tags(struct bpf_verifier_env *env,
>> +			      const struct btf *btf, u32 type_id,
>> +			      u32 *tags)
>> +{
>> +	const struct btf_type *t;
>> +
>> +	/* Find the first pointer type in the chain. */
>> +	t =3D btf_type_skip_modifiers(btf, type_id, NULL);
>> +	if (!t || !btf_type_is_ptr(t))
>> +		return 0;
>> +
>> +	/* We got a pointer, get all associated type tags. */
>> +	t =3D btf_type_by_id(btf, t->type);
>> +	while (t && btf_type_is_type_tag(t)) {
>
> [Severity: High]
> Does this loop terminate prematurely if the type tag is preceded by other
> modifiers like CONST, VOLATILE, or TYPEDEF?
>
> If the target type of the pointer is structured as:
> PTR -> CONST -> TYPE_TAG("arena") -> INT
>
> It appears btf_type_is_type_tag(t) would evaluate to false at the CONST
> modifier, causing the loop to exit and valid arena tags to be missed
> entirely.
>

Fair point, we can make the loop continue until it finds either a base
type or a pointer type.

>> +		const char *tag =3D __btf_name_by_offset(btf, t->name_off);
>> +
>> +		if (strcmp(tag, "arena") =3D=3D 0) {
>> +			*tags |=3D ARG_TAG_ARENA;
>> +		} else {
>> +			bpf_log(&env->log, "function signature member has unsupported type t=
ag '%s'\n",
>> +				tag);
>> +			return -EOPNOTSUPP;
>> +		}
>
> [Severity: High]
> Will this unconditionally reject valid BPF programs that contain
> unrecognized type tags like __user or __rcu?
>
> Prior to this change, standard kernel type tags on pointer arguments were
> naturally skipped by the verifier. Returning -EOPNOTSUPP here for anythin=
g
> other than arena seems like it might cause a backward compatibility
> regression for existing global subprograms that accept standard tagged
> pointers.
>

Right now imo we don't want global BPF subprogs to be able to return those
variable types in the first place. We can expand this if we ever do.

>> +
>> +		t =3D btf_type_by_id(btf, t->type);
>> +	}
>> +
>> +	return 0;
>> +}

