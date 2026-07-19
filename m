Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63C1386C9
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784462529; cv=none; b=U1rxih3XCXstQxFZwHw2QL/4/bGq9BVeiUtVuQKxVCs8K1/abDB+C4V0dYPFw9OByZwb6sVuxChN+t2LdwiJ42uABbIpc6Czu6SIeDR/ou9TbtxLqolqWcu6I3oQX/6oGpX3VHH/RAY3ywBqd1JizJTa3fOUWG7r2zWBXyGgxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784462529; c=relaxed/simple;
	bh=crLKfKSNuXiC9EWrD8lnMeXCugkwlEgYbzJdTF6Ocjs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=M9PnwStAxk6QEXByQUEe5ddjygZxThTf9ypaWeHJhzy7wYN5P2Byd7xXveBOs/88sU0oMLCXYdaQtvDfJK5We06RcrtasW+bJE+x4ywUkwJU3oafalt+aYot3IJ4LicB6+DgJQDYG0CrzZ9SlYaEl5Se8rWbkYgKfihDXhRfae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rl7Bju5D; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rl7Bju5D"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4784b41f3aeso1436109f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 05:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784462526; x=1785067326; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZzBSwW8MVDWvYCXQ+ucsCugAcDr4PVX8fEAbJpnAx+I=;
        b=Rl7Bju5DE+9g+M8u2oEqMvptDb68rK3BYsXmTy2Rrn/Gc+Z2zPUQ6eEAl1U6QTYT9b
         kfffzBHkCRG4Rbor90qYA9SpT/xEMmBouqjVUzzFhx0L3a8XrZM3Tjz9QUfYXuG5SBWI
         mNv7ZaPyEcZyu8/eje0uWoDawI6aIM7xmjWSrwesDQX5ilnHBvpu9h4YOqLx0Gc5shFU
         F3De0v4QAiDFEMfWcuPa9ZE6azyEGxtNXJ78nxnIly6zdFUEfi8bsMVv47+aTXnMMwup
         JaOlWR01Nl1rFrAeZh4v0yzke5i9kegSdEVdQ5QvMvOMZE3QcD1Ko8BKUj1ZjbDEJUQg
         2VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784462526; x=1785067326;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzBSwW8MVDWvYCXQ+ucsCugAcDr4PVX8fEAbJpnAx+I=;
        b=fPJ7yx+UtJv218ej3wGYI4RVY7DRTySU+RMpFBgQDcFqt/aImQLTkJUKTULbphxXy2
         +w2qYWkQIUTu8IgXgt2jxTRT7XnEIL7iF1qz3mbFcyP2rRF6TzOSOoejxjl+a3daGOcd
         Zs0SRwT+F0wyZ1IydC7hVjunf7n9SQCGPhLXcdKASnQFk59up97geP9ckLIyc2Va2YnY
         /y5JTVBko9jIpIyNEnFP+4oVP/v3sax9pE1cnPKwWYCE9vJ7LvkK2VsgE++h89oWQFAs
         EHr6JRqJOuqX2Cs9GFEAxEE50C7dsZN6UkL/P1+vFfmVxUonoBVlps2WOO+0RWXO4D6g
         lszw==
X-Gm-Message-State: AOJu0Yw8V5hEwIlR1tK9qbZowvtX6SzqGYgDQwSVeVA5dNOGqMaGFo00
	jBMoYiD5BUctC2nM48UZLPNK1UGNJu1zsjV4xwen5HQmvR/Tv5sGyhwy1qNiLWUE
X-Gm-Gg: AfdE7cn4E0QEcHhHAkHD3UKhYIvUy9eigE6swXlQoD6Eo+ZUlDStjWXHTxbzdc7l3lD
	XZS97EmuvB/2s1WQcoGdx4iIBZ9j8thG2EdZMFAkaO1bLavGZrjySocG84ryT98EnDTUZ8hOBgU
	XlUD6b9s16AklH/Cs3t3IJj/jwcn5Dwe8PJEP6l3FqnKxXzY2NRPwlxNMliXn1zqTE/uGOzqBkc
	zmsNr9J73JUm1id3tj0TakRRzAWg6ugy62sROZZMWSVdbB7319n8Pydx4wygCdBkK284c6kQZVp
	v/pc0tazMrgkTVdq5j4TZf5PQTKRE2v7YkvJpBe4dJpil3z1iS86SBpFetavuBwTR11Yd5UPNPY
	ZrJQXScsbJX5twQycgKp+g6t0BchbZIiwWW6mA0RbzdwVBhUa4Vgz+r5F9IxxOW0jepB9WHDxb0
	T7Un9Fl1Wbez8h/kcooEm+QpYhFuiJ6U/5XF+bNKWWcyzfW0xErrrF+cyRjv7NRtrPWhcFy0qjK
	JdMHN7Y7NgXEydnm3TfY8gNS8WsGdXtD1/mgOFZKIJ8
X-Received: by 2002:a7b:c383:0:b0:495:48d7:7eaf with SMTP id 5b1f17b1804b1-4954a40bbd3mr67218065e9.28.1784462526188;
        Sun, 19 Jul 2026 05:02:06 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm172701825e9.0.2026.07.19.05.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 14:02:04 +0200
Message-Id: <DK2J66UJL9Y2.1CFPFRV92X1S5@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/2] bpf: Allow bpf_res_spin_lock() in all
 contexts
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260719113551.1294284-1-memxor@gmail.com>
 <20260719113551.1294284-2-memxor@gmail.com>
 <20260719115625.B498D1F000E9@smtp.kernel.org>
In-Reply-To: <20260719115625.B498D1F000E9@smtp.kernel.org>

On Sun Jul 19, 2026 at 1:56 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] bpf_res_spin_lock() remains disabled for socket filter program=
s, contradicting the commit title 'Allow bpf_res_spin_lock() in all context=
s'.
>
> Pre-existing issues:
> - [High] When parsing BTF fields, the check for a valid `bpf_res_spin_loc=
k` offset incorrectly checks `rec->spin_lock_off` instead of `rec->res_spin=
_lock_off`.
> --
>
> --- Patch [1]: [PATCH bpf-next v1 1/2] bpf: Allow bpf_res_spin_lock() in =
all contexts ---
> commit 88a844e18ff8ff22c90389d929ce1c63353b73fe
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Allow bpf_res_spin_lock() in all contexts
>
> This commit removes the restriction that prevents tracing programs from
> using bpf_res_spin_lock(). The stated goal is to allow its use in all
> contexts.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 4446f0bde88b5..bb6e16668d0d1 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -17815,7 +17815,9 @@ static int check_map_prog_compatibility(struct b=
pf_verifier_env *env,
>>  			verbose(env, "socket filter progs cannot use bpf_spin_lock yet\n");
>>  			return -EINVAL;
>>  		}
>> +	}
>
> [Severity: Medium]
> The commit message states the goal is to allow bpf_res_spin_lock() in all
> contexts. However, just above this block in check_map_prog_compatibility(=
),
> there is a check that still blocks it:
>
> 	if (btf_record_has_field(map->record, BPF_SPIN_LOCK | BPF_RES_SPIN_LOCK)=
) {
> 		if (prog_type =3D=3D BPF_PROG_TYPE_SOCKET_FILTER) {
>
> Does this contradict the commit title by leaving it disabled for socket
> filter programs?
>

We don't want to enable it for socket filter.

>>
>> +	if (btf_record_has_field(map->record, BPF_SPIN_LOCK)) {
>>  		if (is_tracing_prog_type(prog_type)) {
>>  			verbose(env, "tracing progs cannot use bpf_spin_lock yet\n");
>>  			return -EINVAL;
>
>
> While reviewing this area, I also noticed a potential issue in another fi=
le.
>
> kernel/bpf/btf.c:btf_parse_fields() {
> 	...
> 		case BPF_RES_SPIN_LOCK:
> 			WARN_ON_ONCE(rec->spin_lock_off >=3D 0);
> 			/* Cache offset for faster lookup at runtime */
> 			rec->res_spin_lock_off =3D rec->fields[i].offset;
> 			break;
> 	...
> }
>
> [Severity: High]
> This is a pre-existing issue, but does this WARN_ON_ONCE() incorrectly ch=
eck
> rec->spin_lock_off instead of rec->res_spin_lock_off?
>
> If a user creates a BPF map value containing both a bpf_spin_lock and a
> bpf_res_spin_lock, and BPF_SPIN_LOCK is parsed first, rec->spin_lock_off =
will
> be non-negative. When BPF_RES_SPIN_LOCK is then processed, it appears thi=
s
> would trivially trigger the warning, which could cause a kernel panic if
> panic_on_warn is enabled.

Yeah, it's not that serious, but will fix when I respin (or follow up separ=
ately).
That said, for now, I will wait for more reviews.
