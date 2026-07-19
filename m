Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16F3A4274
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784476261; cv=none; b=VoqN++ygKGYhkOHoB/nh/8FAjE/2BFS5p18sEyKXYNCekotKY2Wn5lF40oqFyCr0Ts/hkG32lvGU+zSXGpJvMBLkZfLgXPsWBFDL16rO2BkfgkZ8x7mzqsy7ZutPM+6l3jNvsyCOYtn39sNqcmB3VWCtFCYoMSMTQwaTXIuBUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784476261; c=relaxed/simple;
	bh=M42+QN7g06FnCWI24XlVFuqTmluNJh0Hjbo/TmkFubk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YSMPSdcqxiLBzEGYQU2qhIQPg5ZfqrB2LBuGmOsjDar27xQwqOogpJms+XWjJ0jSLvJL2S4ZQbCcRqPPjgRUuZYvRJtFQCagtr1KxmSe2r1P5RyvcrigQYGVTmHi46HvllFtkqL8KnYfUDzO1P8RxJ8IU3ooR/qCVhMnqbm4SGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgVtiOjR; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgVtiOjR"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4744516a312so1277534f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784476258; x=1785081058; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXkXoZcPYatQN5jk0nmNsirA5Eu/FVrdYn879C+3tX8=;
        b=FgVtiOjRk3q2LFmcfzGQjQK+rMfd5gVO2SeeMs1W6IUuMpg8YHcjmia8EsoV/HFOgy
         4CKZVyHC5HT7qPgoTGhovWI5nykZ5FMmPGTQ5kHNseYTwXJhsjiSsi/WKfULpOtfuasC
         p8cOZ/PSTDl9J1orLLvxsRq+HuUMC+5ZzxaxgZo/wPbti235yP5EZ8EqMnJr2g1JHNOb
         gEoEj4GNXkQEoP+c+PN5M5f71vms5oY/sL46CqH6NSlc+fwFOHMvxkSYOLyYZ8KiFhPk
         r19s+K8PfHEHWTtD7BSIc9KWXobya4hceOO0DpWDK2FklSNGp/AX42LtwwTxDqhnERvg
         vZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784476258; x=1785081058;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXkXoZcPYatQN5jk0nmNsirA5Eu/FVrdYn879C+3tX8=;
        b=W9EWQf5Yc1WQiseJwgD3zx/fBqhmP5CywEOdCLuuxw32Z8Hlm1YaMbgw3xrNDszyKA
         ADa/IT0Uge3NUPhmuajuVC3h6K5iX9i2QOE/aculnlZ2nYrRSSmI2k766NcD07HF8IVm
         FU94qVe3HyLeCVg0OOAUtsQ/U6ZUvE6L/4OfEgPuhYc0b3tgCkwdMVSpieHCPxzdjHlJ
         pW5e53FswwE4WFlk24MLSxI/pQkzNu0kRv2u2/i4wuWT3If5S/bMQC6iWMLXN8AofA8o
         a/pnOP/oyn/CwBgUrXJ/snhKRExo82l1rhOgVP8EDXgsDjJAMtfpb6rZvQRbypr9Opmw
         wE9Q==
X-Gm-Message-State: AOJu0Ywr7VfL9sWrtmpjr4f/aPw1PAh+kUevkaHJdkxyRTFxm00JfHc1
	f8zgooYWMamHMUEL74XJ3tV1/gswzn1wklD09yVTO30zHj5xQ49C2NOeKNZYgqcg
X-Gm-Gg: AfdE7clvpLlEjLG0IefYc6ig1VHmqHiSSg5XRWTAPiMNoVW5YvOwodfUOyoUa4ivxSB
	wQl2n77yM56HElN0N3FFnuOXaRS3VMbo0IbaTfqKY+bVmQjxeF04/ObOyB9XuPfurZ9W3a1b+rP
	qUJs1hAccUEl9IGnOZeE5fgb2M5VY7U9db9q5r+u0QKXIlodLqkNlnMOmT6BNCqlE9C8MrePIc0
	9XlSTBJ2QOuYkuQI2jKJzv3+HLR4LpkmJfuObtxSRnIOWD8bmoFb14XrqejrPLrbwxKouuHgUMv
	5peMnqpsRedkSn7T8rdVVanFt7ccj3ngSfckIRkdy1VzsoiRTSJBT9SMXfYnGeVnEo/SVlobISu
	m/NDIC7vJb1Hvu0OkvqJnVMyuPS/g+Pgk+D9RJt0GvoXtza49RpCHTx9Svw2KywZ3gI3UqT8tMN
	xpL1bCUwMNogFJgZi3KZudQx0kpP/nN1rc6pakK6FjGSLsjfTbPW5UMM3fktZX7PBfVpIzkPomK
	BDKV/KroogHs59YbJ4jtVwZ4WOb4nJjduR4XQq1OhIx
X-Received: by 2002:a5d:6f05:0:b0:47f:7045:dab8 with SMTP id ffacd0b85a97d-47f7045db28mr4801609f8f.7.1784476257907;
        Sun, 19 Jul 2026 08:50:57 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6b85970esm15744545f8f.15.2026.07.19.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:50:56 +0200
Message-Id: <DK2O1FA85Q5Y.20IOU7GKJ6O6G@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/5] bpf: Fix offset warn check for
 bpf_res_spin_lock
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260719153634.2908692-1-memxor@gmail.com>
 <20260719153634.2908692-2-memxor@gmail.com>
 <20260719154827.54DA51F000E9@smtp.kernel.org>
In-Reply-To: <20260719154827.54DA51F000E9@smtp.kernel.org>

On Sun Jul 19, 2026 at 5:48 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Userspace-triggerable kernel warning (WARN_ON_ONCE) due to neste=
d struct bypassing `seen_mask` uniqueness check, potentially leading to ker=
nel panic.
> --
>
> --- Patch [1]: [PATCH bpf-next v2 1/5] bpf: Fix offset warn check for bpf=
_res_spin_lock ---
> commit f617fbd9a79f403f8e8be07c38922dcd0eedd840
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Fix offset warn check for bpf_res_spin_lock
>
> This commit fixes an incorrect offset check for BPF_RES_SPIN_LOCK in
> btf_parse_fields(). It now correctly checks res_spin_lock_off instead of
> spin_lock_off.
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index cbb1e49b9bcbf..e7d4e9ba24e26 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>> @@ -4168,7 +4168,7 @@ struct btf_record *btf_parse_fields(const struct b=
tf *btf, const struct btf_type
>>  			rec->spin_lock_off =3D rec->fields[i].offset;
>>  			break;
>>  		case BPF_RES_SPIN_LOCK:
>> -			WARN_ON_ONCE(rec->spin_lock_off >=3D 0);
>> +			WARN_ON_ONCE(rec->res_spin_lock_off >=3D 0);
>
> [Severity: High]
> This is a pre-existing issue, but could this WARN_ON_ONCE() be triggered
> from userspace and cause a kernel panic on systems with panic_on_warn
> enabled?
>
> If a crafted BTF with multiple identical unique fields (like
> BPF_RES_SPIN_LOCK) is provided in different nested structures, it appears
> btf_find_struct_field() resets seen_mask to 0 for each nested level:
>
> kernel/bpf/btf.c:btf_find_struct_field() {
> 	u32 i, off, seen_mask =3D 0;
> 	...
> }
>
> This could allow duplicate unique fields to bypass the seen_mask check an=
d
> be returned to btf_parse_fields(). When iterating over these duplicates
> here, would it hit this WARN_ON_ONCE() and panic the system? Should we
> return an error instead of warning, or pass seen_mask down during the
> recursive struct traversal to prevent this?
>
>>  			/* Cache offset for faster lookup at runtime */
>>  			rec->res_spin_lock_off =3D rec->fields[i].offset;
>>  			break;

Fixed by next commit.
