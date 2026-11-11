Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420480;
	b=WhEgRhQk0YICFO+LVcWhosffMQ89GEfq2qHvNbnll1RktC+vGS937bO9ss4EThZHRkkw
	 d/jUVhTNS3d/fHLfBTzYR6yb5g38oL2b20SDiaXOx32VnVq7a1BXgdBkl7CpY1y7OTspa
	 4WqW6iOS5IFaqJoiZ/Dtjj9h8tRVn6kvo3S1e/ci2q/6THCss1vRJT7dqemj08OGLW0xN
	 mLCYeKHEaGYGpGqUOl29NVnzZa3YvFa8+fCtdkwWjewfcEpNzHduzN+SN5rUQf/Xb49MC
	 COvgQcAgBn0ysOozXXHhLp2yFz8I0lrluYeVisI4rlLvxWBQCZKAf1frjOvq7UJomtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type;
	bh=Dr6L6LTyTheZ7MJebrdlyOleZNT81+rS/ZxvoiAlOaw=;
	b=PghV1v2nk2jH/g1URks8juDjMeYtgwsqP8wQsQX0fTgR8AYXRl2QNPoml5r4cZsqbRr8
	 yXfR+T8dcf5gk9WwgBG1y3fnBOiRhSe21P5XwP2nn4ifvyyQYOmUBao49zhq4ReM03RON
	 ghyda+lMOyGi3ngv50t5NMfnLg2/d4y+Yj7r/rmF1EdeTsb1zZOYjM8Kufkz54Wud0aMC
	 X4WIU/nOFClaYdk0O9/OueD9HWT/qX+veLKgTc8G8xffxWzYmGiaVpTgMBszCULQZyRZv
	 3zKaJSe/wNn2+2jlXR8g2unimdytbSPIbbUJnPp8o2kBSvVAA4Og/PjQy+6Fik6C46w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XS1qIIWW;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D88606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 18:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D88606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XS1qIIWW
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so32076525e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794420478; x=1795025278; darn=lists.linux.dev;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dr6L6LTyTheZ7MJebrdlyOleZNT81+rS/ZxvoiAlOaw=;
        b=XS1qIIWWHWuL1cGwLEaMfHgtUrkZM22vC+vUY72M2TSs6WOAURBH/Ux0UfOhULxTUJ
         EUWv26o40tv9shGog3ZT1PhdjgoMvLbAKSTacrOni7Ltptm45ana5p7A7Z87cScRHX3d
         R5mt/ZQSyWm6b33SKtC75iShB3zc1D5xPXgkofIfpFmrXkDvbtkDbaEvO1Ra2aM0YrOi
         DSfytaG6YhS/HJT9mJK5pzeQ68lzFqzHeLwymTiTMYeiamG8WJ06kl4VxGoDUbx0tPPu
         SL3GRANTV98HA18kOA4kwqGcO9ddwO/3iv/Rnj+XZLA7GDoJUYfBc1f+86mEZSRlbhqQ
         jvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420478; x=1795025278;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dr6L6LTyTheZ7MJebrdlyOleZNT81+rS/ZxvoiAlOaw=;
        b=hBkTEpQywIGjd8mqNOVozIuDrJZdiR1HJJpKA8Q4Jio++rt+O3wW5lgqqCCYaXIwTI
         gkCWjOt1AfU2JmMhEY8sbtOJjW50wcZlXGHbTy/RKBsq0M0UZ+ZsoJlpHBufLmtA3W67
         s7govjFp7ZT7fKNMv7QZRkAD/3ecZN09eeMvUr6jmwzj5qE4FPOkh/r3Tt9Gm63BhQNV
         oZZinlX1TVVN4+Sh0vnqvkzdNsVhXvx0VnEenFZur1C8/zur32vzprNPESpoWo1eGqYM
         VUGEjKI6ZEYf8XZ0AZQut9bNnUJ60eHNuElGAa9vYX06Oaok6/+Ww3VGM+xegzX78gzn
         gKbg==
X-Gm-Message-State: APuU4Z/QPjp/UxD7Pm1m/At44qnTzZPFyjW1cv15ueGN9beKZyhsb+jZ
	r2iQGHE8jNu2ST0Kuy7hSp4fteQXz2XU6CEj/rnOSnBldSxp4DMkiUCCtpgE8CoOd+4=
X-Gm-Gg: AYBFou2qVo5LjxiVTpXLd6tDj2NAN/+mzDN/O2KVmFhcBVU/P4DEdwiFEeYn4rrSI6d
	ZWLW8h64tQPYeEeDnhSpMph/1cjZw+87p4YQgjXQdNuYi8VN3SKBVWYAoJ9aVHDm5Plj7+P9puY
	IAtpy/6ce2UUM9QAfhPvc7yY8ojXxx0KymqGx0rqIfhdSsmQ+dOmA4B4Bgmed8/Dwiyvv4pSsBq
	bxmGReconPSbc6QMxPztVO3mh0X0PSiNS8o9c4x53/qJfFfitgJdPCohp/86JD7waxLUvRvD4u6
	2uOnm80eJWKkUUuC6JUWdUVlh9cd/IuksA4CGD2wFJiquhHsKkiR/GC3GPzJzHHcQtslcjIaVup
	bY3SEOxRlew9XK5rjIUUGD4a6beK8THxd5EHW8+lQNj9QVYta80PNQ7yJN8kyPR6ndISvMnVkSO
	n1BEID4KC+/zEkqy0Qjh0kwCMIxALF1Qadu8JYfStf1J2137vjJdYeeUud/3jdin/Y8F9BBpnTA
	qmou4w+HLNNlrKCSe+D4tusMNXnuj/onRJdlfYhqJYfZdyyye2T7O97PTbDMr1rA9YEAKCFKPal
	K+Ekv24FI+yNLpabcPS+3Cpjtn8EoW4s0vpfqXcQ9OwgEUhjPcK5cqEySI68IFe2pTBXeYCwPfT
	+i846OARJGE8E9l2T9iZIKVW5vm1NzcdxIqOC4zxD8vc=
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ba093583eemr53113775e9.9.1794420478047;
        Wed, 11 Nov 2026 10:07:58 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e27a8b0sm5301115e9.15.2026.11.11.10.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:07:56 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <86085222-625d-41aa-8b60-2ac8960ffb76@gmail.com>
Date: Wed, 11 Nov 2026 18:07:55 +0000
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] kconfig: wrap long expressions in menuconfig
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: ojeda@kernel.org, a.hindborg@kernel.org, nico@fluxnic.net,
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, jakub.git@horky.net,
 linux-kbuild@vger.kernel.org, gary@garyguo.net
References: <20261110173526.1548434-1-julianbraha@gmail.com>
 <20261110173526.1548434-3-julianbraha@gmail.com>
 <sashiko-outbox-209420@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <sashiko-outbox-209420@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2YgqhCnYwobn2orogHEgpL9Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2YgqhCnYwobn2orogHEgpL9Y
Content-Type: multipart/mixed; boundary="------------DYp1KHBOXMdl7yEfQ0JE6JLl";
 protected-headers="v1"; hp="clear"
Message-ID: <86085222-625d-41aa-8b60-2ac8960ffb76@gmail.com>
Date: Wed, 11 Nov 2026 18:07:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] kconfig: wrap long expressions in menuconfig
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: ojeda@kernel.org, a.hindborg@kernel.org, nico@fluxnic.net,
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, jakub.git@horky.net,
 linux-kbuild@vger.kernel.org, gary@garyguo.net
References: <20261110173526.1548434-1-julianbraha@gmail.com>
 <20261110173526.1548434-3-julianbraha@gmail.com>
 <sashiko-outbox-209420@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <sashiko-outbox-209420@kernel.org>

--------------DYp1KHBOXMdl7yEfQ0JE6JLl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/11/26 17:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kconfig: broken '(' and operator wrapping in
>   expr_print_gstr_helper()
> --
>=20
> commit 89202a55a9cf081fc680fbfa051ebe8d0cfa7113
> Author: Julian Braha <julianbraha@gmail.com>
>=20
> kconfig: wrap long expressions in menuconfig
>=20
> This commit wraps long Kconfig expressions across lines with matching
> indentation in menuconfig search and help text, keeping '!' prefixes an=
d
> value annotations attached to their symbols.
>=20
>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index 2b91d16bf14fb..9284ccb20259c 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -1155,30 +1155,40 @@ static void expr_print_gstr_helper(void *data,=
 struct symbol *sym, const char *s
>>  	if (sym)
>>  		sym_str =3D sym_get_string_value(sym);
>> =20
>> -	if (gs->max_width) {
>> +	if (gs->max_width && !strchr(str, '\n')) {
>>  		unsigned extra_length =3D strlen(str);
>>  		const char *last_cr =3D strrchr(gs->s, '\n');
>>  		unsigned last_line_length;
>> +		unsigned int prefix_len =3D strlen(gs->s) - gs->wrap_pos;
>> =20
>> -		if (sym_str)
>> +		/* Ensure the value annotation stays attached to the symbol on wrap=
 */
>> +		if (sym_str && sym->type !=3D S_UNKNOWN)
>>  			extra_length +=3D 4 + strlen(sym_str);
>> =20
>> -		if (!last_cr)
>> -			last_cr =3D gs->s;
>> +		last_line_length =3D strlen(last_cr ? last_cr + 1 : gs->s);
>> =20
>> -		last_line_length =3D strlen(gs->s) - (last_cr - gs->s);
>> -
>> -		if ((last_line_length + extra_length) > gs->max_width)
>> -			str_append(gs, "\\\n");
>> +		if (last_line_length > gs->indent + prefix_len &&
>> +		    last_line_length + extra_length > gs->max_width) {
>> +			gs->s[gs->wrap_pos] =3D '\0';
>> +			str_printf(gs, "\n%*s", gs->indent, "");
>> +			while (prefix_len--)
>> +				str_append(gs, "!");
>> +			if (!sym)
>> +				str +=3D strspn(str, " ");
>> +		}
>>  	}
>> =20
>>  	str_append(gs, str);
>>  	if (sym && sym->type !=3D S_UNKNOWN)
>>  		str_printf(gs, " [=3D%s]", sym_str);
>> +	/* Ensure '!' stays attached to the symbol on wrap */
>> +	if (sym || strcmp(str, "!"))
>> +		gs->wrap_pos =3D strlen(gs->s);
>>  }
> [Severity: Low]
> Does expr_print_gstr_helper() mishandle wrapping around "(" and wrapped=

> operators?
>=20
> When expr_print() formats a negated parenthesized expression such as
> "!(A || B)", it emits "!" and then "(" before the first symbol.  Becaus=
e
> strcmp("(", "!") is non-zero, printing "(" updates gs->wrap_pos to poin=
t
> after "!(" and resets prefix_len to 0.  If the first symbol plus its
> "[=3D...]" annotation then exceeds gs->max_width, it wraps after "(",
> leaving "!(" (or "(") dangling at the end of the previous line.
>=20
> In addition, the guard "last_line_length > gs->indent + prefix_len"
> assumes only indentation and "!" can precede the first symbol on a line=
=2E
> After " && " or " || " wraps onto a new line (or after "(" or "[" is
> printed at the start of a line), gs->wrap_pos is updated past that toke=
n,
> making last_line_length greater than gs->indent + prefix_len before any=

> symbol is printed on the line.  If the following symbol and its value
> annotation exceed gs->max_width, expr_print_gstr_helper() wraps a secon=
d
> time and leaves "&& ", "|| ", "(" or "[" stranded on a line by itself.
>=20
> -- Sashiko AI review =C2=B7 https://sashiko.dev/#/
> patchset/20261110173526.1548434-1-julianbraha@gmail.com?part=3D2
>=20

Sashiko is hallucinating this time.

I mean, what it's saying is correct, but this is intended behavior not a
bug.

- Julian Braha

--------------DYp1KHBOXMdl7yEfQ0JE6JLl--

--------------2YgqhCnYwobn2orogHEgpL9Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavSu+wUDAAAAAAAKCRDElYPCBXNxIHCK
AP4vp9i2du+IMG1TAXWX8fIRLdqwBhfKh22XNBYcb4Z5qwEApEedx8d8HxSEf9Bzx5914VRB9W1r
h3M4MMxDa8Dulwo=
=dZ0l
-----END PGP SIGNATURE-----

--------------2YgqhCnYwobn2orogHEgpL9Y--
