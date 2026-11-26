Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701156;
	b=SOxWt8xznvBLXmjwx/S2Bkwcs0apRHMD2S46sTN6LyreOhybxeq8TGO1Th1gIFegnaQG
	 TqiKNRSqN/WTpovZ7BlysFUYFMTLYvwwbC2yGq4Z94Tfqmok52Kopd+alfUGNVw0vO1Al
	 yrArQe2R87q5M7XF2RKPbmjA4p0zyMdfv3uGArRIP1GFGciMfxJkGmCdbsodScPkxNpH/
	 a+l7CRhNHhE4Hy5Yl9wIi+gfVPnh+f2goZDjFYEcPbsOxpT4S5HKXJOXJBlWDCfl83vpa
	 SUHWcWGuJtKojCedmAEsRvKgwhGGZL9BwApC2tOPYAPQYESHEksLrWvkqSIm4ZC4j7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701156;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:X-Clacks-Overhead:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=PnIJQAG9PVP5cW6nxOZMTWBL/H9qDNzUatre97N764I=;
	b=N2SyLl8tc4MHdKpRmQCH57ZptgLXptrVeR6m9hyCgLRUfHmT60qGzA8YdYRK0NROm2vT
	 Q8uTB1w5GMA81WLdgT1eu43YOuFA1efbHKnfrADVO3WGASmqPi0h5s8BoNA2LLIxXR7aP
	 uQdXCpTJ6GRfcWal2oXikCLQgGio9SwdKhnqKeBzbETMOua5XUAFTehqgvKzJUVxLxsV6
	 7W2/6Yd9bySFp13OYWvEb5kTNCGdeUjMBb7tzGOCSSWti1yDBcRUKeBD7BAvXcMgr9CEn
	 UGxGmy1wrFc+ISrC6JBCMjc1fAtEp3uhCLCalHDba8VSD9bAwK6Tbh2QYIDL+TH1lpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	dkim=pass header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b="nqs+hz/c";
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761FD606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 13:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 761FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.a=rsa-sha256 header.s=20161023 header.b=nqs+hz/c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1795701153; bh=RrNdxFyecXMWMdkm8aO9a1YP9s2Izo+Q+WVzcDak2JI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nqs+hz/c2i4kdiWxnxNT+MUX2LeNqxfcJ7NAmd39uKR26CKWQKk8S2u5075m8EUlu
	 XS2uo/Pqdeb51QlcZRBG9qE8AaNFA1t9Z2gRiXcmgOO1D/M2CgC+Z63h8utmCmjxtH
	 UO0eRN/mh/F/Z9pt0SpIFT2+0x4Hg1gW8MOOvDOAW3cVqDEsvkZg4OES2ytSP/BB89
	 87LdA5kloFJE+Q0at2Oba06POaR+Ev10KlEa6WnfJt2N4hycTegH1BlSsS7Uziz4Z6
	 NClqhPTawixwzVzjV8tHHwbGrPM8die1DC4t0aQylo8IY+J7ovcqY5UCsh/zq671P/
	 4eMJZNbTl6sdQ==
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 4/7] libbpf: Move bpf_object_prepare_token()
 to object creation
In-Reply-To: <sashiko-outbox-235632@kernel.org>
References: <20261126-bpf-relax-get-next-id-v2-0-039e92757f9c@toke.dk>
 <20261126-bpf-relax-get-next-id-v2-4-039e92757f9c@toke.dk>
 <sashiko-outbox-235632@kernel.org>
Date: Thu, 26 Nov 2026 14:52:32 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87wlpzd7j3.fsf@toke.dk>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] libbpf: bpf_object_open() runs bpf_object_prepare_token()
>   before gen_loader
> --
>
> commit c11c45202857082e826eb4bc3551463d49a2d5fa
> Author: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
>
> libbpf: Move bpf_object_prepare_token() to object creation
>
> This commit moves bpf_object_prepare_token() from bpf_object_prepare() to
> bpf_object_open() so that the BPF token is available before loading the
> object, such as during BTF access in bpf_program__set_attach_target().
>
>> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
>> index 540daf7752b45..6d0e71aff3e14 100644
>> --- a/tools/lib/bpf/libbpf.c
>> +++ b/tools/lib/bpf/libbpf.c
>> @@ -9281,6 +9281,7 @@ static struct bpf_object *bpf_object_open(const ch=
ar *path, const void *obj_buf,
>>  	err =3D err ? : bpf_object__init_maps(obj, opts);
>>  	err =3D err ? : bpf_object_init_progs(obj, opts);
>>  	err =3D err ? : bpf_object__collect_relos(obj);
>> +	err =3D err ? : bpf_object_prepare_token(obj);
>>  	if (err)
>>  		goto out;
>>=20=20
>
> [Severity: Medium]
> Does calling bpf_object_prepare_token() during bpf_object_open() bypass t=
he
> obj->gen_loader check added in d92defe04ad5 ("libbpf: Skip BPF token
> preparation when generating loader")?
>
> obj->gen_loader is only set when the caller invokes bpf_object__gen_loade=
r()
> on the already-opened object, so it is always NULL inside bpf_object_open=
():
>
> tools/lib/bpf/libbpf.c:bpf_object_prepare_token() {
> 	...
> 	if (obj->gen_loader)
> 		return 0;
> 	...
> }
>
> If the host has a token-delegated bpffs mounted at /sys/fs/bpf (or
> LIBBPF_BPF_TOKEN_PATH set), bpf_object_open() populates obj->token_fd and
> bpf_object__gen_loader() does not clear it.  Subsequent calls to
> bpf_object__create_map() and bpf_object_load_prog() then set BPF_F_TOKEN_=
FD
> in the generated loader program's map_flags and prog_flags without a
> runtime token_fd, causing the generated loader to fail at runtime.

Ah, I had not noticed that gen_loader was set in a separate call. I'll
add clearing of the token_fd to bpf_object__gen_loader() and respin.

-Toke

pw-bot: cr
