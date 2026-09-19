Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991ED248896
	for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 01:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789781174; cv=none; b=gAc1Lh3GupqKeSK7qukGG2dtBMeM7n19RRhXccCQ78vCx6IVNTHZb2aQISnY6Y8i+03Ms8szGKk2nrgA1rc6qLxZmiGOO+2x5u3A+enjhuxosYAr4CTNlMyhDkh+inz7F7/+Qyi8fepes0H5gHiNUuFVyxjE/vfKY2VWP55mpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789781174; c=relaxed/simple;
	bh=pw0xVBSJMGSqUzehos+pMIH+RXRHeVNDafs64hQjF6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=qDM5y+nhB9Jmul0bPnym05gBTllosC9xRvIVMPP52cVBdgWyjo25A4CjKjwECD3y4wvcExiCPsggthKGuuy04GvUB6vi/6oExs2nX3ICY8R0jygGwHh87LUgUyeQT6Pk/7E2dFYxWY4Dp54fKfSdvTwbB9G3uJy0F7/lUyjG3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlUwvSrY; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlUwvSrY"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-486e4e15deaso314914f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 18:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789781171; x=1790385971; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AzYIXAlKfxIW6Tyqomxe2Cchgk0IVoHHDbzwuQj/rqg=;
        b=ZlUwvSrYzCNBG349RuJTdqg45xtR/pazyDEOFPJjkH1UekgbM4o5eTy8XsfCENaA1Q
         0CCMZuClm5JY6+moRYq3VbMbZwof3TR9QvcyMSDIRz0RtQppk7DCFpuc7Srr34ghrjfi
         cvNYNYYvbZxeOisDDQFLIq5MwubV6wmRBjX/KGei5XNIL14v+MWverG7EHc1nbNWozWv
         kY/XxbXuPyZoRjCWICBRL0FDuqRgglWKXoqeI3lS5hVnLpPNZHf85jbcCZ38hoWn5zqS
         w8s20FL44Vy9m5hgF68ODTJlnSSXq2w0a2+mGAoT5EAipq7OdRDsLWiEptSrpEW7V54t
         fAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789781171; x=1790385971;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzYIXAlKfxIW6Tyqomxe2Cchgk0IVoHHDbzwuQj/rqg=;
        b=rcNb2D36AR4OqrcNqHkqTBTXxPZsWRfnpVUIFUael7y/QM7hThEi85w16ENNeDBovz
         46OTgtKQheR4EAkOvs4QIk6VbZh7WE3lAPulfEzpSttSdVfEp+7vVBQ2IT8jjIDBLux8
         xGMtvnO1VP4cTwTQZJpQk/OHbxkstn9jdarSQFGla9hxzIH9ezC7dloXRgR2zqMocTTy
         fsxdGcicJPBN3Dba5oMh58nD7vY312sAC+4qTYMSq1UcKwwyS8ODjPIZo/N/uHELjqtx
         aIZrrLszOwdSlNBIfZ7Y9itV4egNmd2JloXr7oG8UEIZSHfWqwNxYznyF9UCsndwkok1
         dEYA==
X-Gm-Message-State: AFuF++lxIdQIlJQnU06ZjDbsgbwvPyNXx+FJ59kbGjgN6t4jWdy3Jb2C
	6PsAwrnKhFPkdgQOxEW1gLOnR/v1EUpS0Su5jxFs3x/94Xa1qYG5jtEmXuVqv75e
X-Gm-Gg: AYBFou36629O2D0cQ2PQqj26ECmgZ75ztdZ6wP11xYh/AxafIxw7iRXT5zq9ROAit6X
	91Yc2S7qQJPxpTBy6IsR0PlIX0cHpKxPGuCOO/2zUzVkg7oNgGFsx205qwA+GuhlWYaFD10MO7y
	UlJHRcfZ+ObP0WY2FT21gQpLOjeZjsI02wgcKzkjgrI8f6bARmBdeLj3xThXuaMPLcmT7z1KHfj
	TRQUTiZJBM4gpL2pouZp1+LspWSYibrlD+inSQ5T8dWQuWq5axzOqF9nGdATv4GX2UrWp7+KWoh
	PTvNieCQg8g8OK4z5K6gkSVnW6+4pQL1wAUVuaMZqeuM+IZXKsgY9CG4rY7MWrglxHVWsnoucdP
	cqxkSqZQWxQaTRgKOuyA4fXT0K4PIbxoT8cra7HOnlvEXDHtQRIqd+guObN/0SuQ7EKgx8OI5oA
	Dt5pPhy0aJyE+q93JAWi6sdODnzOmhg6tpe6QhGZMxgoSsnseoEQpU5jpvpGC55O3g2FY+JPmzA
	/QJKHNw/b2fbh+juQqtAA8CuYJPMCQuyNVaru37aVJspsb4FJhzbVJbo+LyvFd3gPDoOUCYpsaA
	XTgIcrFKwF4ozLUNJrGA7TttYgWqwMH/gi8zeadOXehOLC7s
X-Received: by 2002:a05:6000:2304:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4871e25d894mr10867826f8f.13.1789781170725;
        Fri, 18 Sep 2026 18:26:10 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245a869asm2825832f8f.37.2026.09.18.18.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 18:26:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 03:26:10 +0200
Message-Id: <DLIWH2PDV8ZI.3NEWOCLKS37IM@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v3 1/2] bpf: Compare stack frames in regs_exact()
X-Mailer: aerc 0.21.0
References: <20260919004327.1403382-1-memxor@gmail.com>
 <20260919004327.1403382-2-memxor@gmail.com>
 <20260919010829.EE9211F00898@smtp.kernel.org>
In-Reply-To: <20260919010829.EE9211F00898@smtp.kernel.org>

On Sat Sep 19, 2026 at 3:08 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: Out-of-bounds array read in bpf_func() due to frameno alias=
ing
> --
>
> commit e17b850ba98b74f1dac193b96d8c0646c06a22d0
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Compare stack frames in regs_exact()
>
> This commit moves frameno into the type-specific metadata union, ahead of
> id, to compare stack frames in regs_exact(). It also moves the
> states_maybe_looping() boundary from frameno to precise.
>
>> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
>> index a7202b44ab105..17be5f7df35af 100644
>> --- a/include/linux/bpf_verifier.h
>> +++ b/include/linux/bpf_verifier.h
>> @@ -45,6 +45,14 @@ struct bpf_reg_state {
>>  	union {
>>  		/* valid when type =3D=3D PTR_TO_PACKET */
>>  		int range;
>> +		/*
>> +		 * Inside the callee two registers can be both PTR_TO_STACK like
>> +		 * R1=3Dfp-8 and R2=3Dfp-8, but one of them points to this function s=
tack
>> +		 * while another to the caller's stack. To differentiate them 'framen=
o'
>> +		 * is used which is an index in bpf_verifier_state->frame[] array
>> +		 * pointing to bpf_func_state.
>> +		 */
>> +		u8 frameno;
>
> [Severity: High]
> Does moving frameno into this union cause an out-of-bounds array read in
> bpf_func()?
>
> For non-stack registers (like PTR_TO_MAP_VALUE), frameno will now contain
> arbitrary aliased bytes (such as the lowest byte of a map address).
>
> In kernel/bpf/verifier.c, functions like get_constant_map_key() and
> process_iter_arg() call bpf_func() unconditionally before verifying the
> register is a stack pointer:
>
> kernel/bpf/verifier.c:get_constant_map_key() {
>     ...
> 	struct bpf_func_state *state =3D bpf_func(env, key);
>     ...
> 	if (key->type !=3D PTR_TO_STACK)
> 		return -EOPNOTSUPP;
>     ...
> }
>
> bpf_func() evaluates env->cur_state->frame[reg->frameno]:
>
> include/linux/bpf_verifier.h:bpf_func() {
> 	struct bpf_verifier_state *cur =3D env->cur_state;
>
> 	return cur->frame[reg->frameno];
> }
>
> If a BPF program passes a non-stack register as an argument, and frameno
> evaluates to a large value (e.g. 255) due to aliasing, it indexes far
> outside the frame array, causing an out-of-bounds read and potential KASA=
N
> panics during program verification.

This seems correct, will fix.
