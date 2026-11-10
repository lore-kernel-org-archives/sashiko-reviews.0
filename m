Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323282;
	b=AcEyjzlYA+X2Q0YzQ1PKkjVuOWxqdwC0Dt7+7CZ6pukBFIonU3ElsWH97FJfk4Q6iUwV
	 gaXM6iw5rzdINNeuNc+Ao8kkiA960QVzMVZykHNfygsJUstQn9gzueyS2IqwGU8j6URLm
	 OT7x1VguMAJsoGa2qv1aI1ARa/xQg78MMD5stibhPAUr8mCDPbUUIlLPC70OJMIh9I4GA
	 MPKUaBrojKIks9hNyZ1ocAoWc9mIhpw/4AHCxancGv5korVyRauX4mejOTboLzN9tPypg
	 hClaRW7zckqBsu7ABO5bfxEGvFc59FezA26N1F2YKoqRGuBu3SO7c8Dj/vhv8Rr8SGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Bk8Y4+BL8s+d95UH4gi81iT+RNas+yqthU8nmbpM9H0=;
	b=bAofVEcEjJ33rRPEyK1wGjx+ockEXyUw3mQ8l/BrHLuG40DVzLRJY3+DlIpr+Gc82jW7
	 FifuUAK2VX7cHWtkkabX9J689Zi2jxJ1sALAfoJ93H+34lfaaA65IVD9+yF6Exm8XXh2y
	 GXsfqqTx4YpqkiYTFYC/vQAwZ+xhE7coFunIVvUKKA15bhr7NUm8egw9T24qx9wIP7029
	 Wfv95bc+2/U6TyPrWigHzdDCzmEuw4A+VwT5q+ngOYMB5zIqzlGstSLU6yx7AbTPmpGE3
	 JWlw6Zd+YzUifSwmYo9ShpbEcxPwF1xELi4sbNQitdui09Rufl5tguSqSoLvBqnu2vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVcx4OKX;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036F606A337
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 15:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C036F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVcx4OKX
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1437915f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 07:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323280; x=1794928080; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bk8Y4+BL8s+d95UH4gi81iT+RNas+yqthU8nmbpM9H0=;
        b=SVcx4OKXfwvA4emNA1OVHjnVXhpMXU/VDRIP/p2iUOdAk80yHtTVHtycHOTvBI028V
         bTzfTzmWJ9lFBzbemAOsYknymIjxPPznwe3kXhLzXkXMOcbtmp9Jsxx87iBUE3zvero5
         +iJRFvmiyMixUMoBQ3ZG7oKDZ9X9ZMW0lVfwcM2iQOTfjkU4zKQ3poQCpyOSGj8RFkic
         PSPXYrShnoznUmcjKx14QgkPfB67dAfg25tXlDxdM03qcWojn9X0MWAeKswqmYyOc16x
         gMmgBgheASfoxwC1lccdHXahLFIPzNsWA1ZP6XSlGotwVPPgHrfSsCx/vfZDOfATQ3p7
         5i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323280; x=1794928080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bk8Y4+BL8s+d95UH4gi81iT+RNas+yqthU8nmbpM9H0=;
        b=zhFwkiNrDC655Y6xuV33MxEmi9ACor4JTitd2d97acaJUusy+cn72rVGXdxt1Dylbe
         fVnEip8/pS7Ws6fCqtFUPKB4n8asBw6lo9HESXe2/2EtC9JshC/KPr1X5ZkFGgZlGUqK
         dTCcq8J9wJUJR01/IopFPY+/fqXS0MYIdprNlRiV0I+ny2FJsZhPhWEKVUUWFStIrI6Y
         jpXGuPlLy+Gc99/2y4yKs+85fAwtOzODe6FsGFgir8AvVs9Dsn3NhnsP6gf6kAMylMf7
         eC/445AL9754p4/1yT7fJ0+br4SNaPFO0GNeSTXZ1yyehFu6ABgAXyoUzRR40u9dwUmy
         yt6g==
X-Gm-Message-State: APuU4Z/1WXr7ZkjY8FKyObd9qfyaHntS8lU1EkQF2Wck6QVANFGUPNYK
	0CZPYIGe9QhIWYWpXBWoR9khOdeGi/SyGzVGBcxH8VIF1plP1XuFuE3bz0qyAg==
X-Gm-Gg: AYBFou0xZ/2zd0XCrkUyMKaw5LISZkRLXR5VAtM/pRc60yK/6YLX82YfDIp7r8zByjh
	rWpbzTulAIZPV7tZCyS/gv/2YMVQwWEQXbMBKm9bRxituBwRrEUYbtFIltsO/bu4nRHHVE3IrJq
	me7416qpPgOvhZdqE1OwIhOHDsoFXL1YGUzCmFZf2R3PAWUbgneWSrYCKGUSkhC5Dt3t5POP6Xx
	W+ONaPgku1zErj4L9SJaIvswAm8fjTNwfemhvsFcwrQWzA4b2BSqNIGKVZ/Linfe6wBYi4+F3mu
	KRj0Yw79Yh7CyH5mhJCfpYA6dHw6c3/JdRziRzh27UtS455g1DEV0CpLIt7VZ57W9U1BBPSM1Bw
	TYzY/ErR/sgG5fvP7JvlgNKxrDGx2+n5krur4oyHqUCdg3UVucxsUZzMMygs+TL42l7Dq2AeaOn
	KpNt61CDmPooBLWUq7NKHx+wKA7+NDz6ohtMf+Vb8eGIDUVX0BO/cYfhhe8X+tqDaWrxegw3PcK
	svXWC+wOD4BDtsZKnE8AXYcT6Q7g6kIcSewwleBwqfAXUDZpmxMRQ4gQBoFbPLo3ey+Yp3SZOD8
	P3Jv8+/ZxlWyv3RW8zQc5FFEneeqy3Z9TR90VQ==
X-Received: by 2002:adf:e009:0:20b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-49830c8ccf6mr3946905f8f.35.1794323280060;
        Tue, 10 Nov 2026 07:08:00 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835858f26sm5477228f8f.18.2026.11.10.07.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:07:59 -0800 (PST)
Date: Tue, 10 Nov 2026 15:19:30 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next 15/18] resolve_btfids: Tag fmod_ret
 candidates as targets
Message-ID: <avM2ArYor7B6-g63@mail.gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
 <20261109170550.141443-16-a.s.protopopov@gmail.com>
 <sashiko-outbox-205381@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-205381@kernel.org>

On 26/11/09 06:13PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] resolve_btfids: skipped duplicate-named functions in
>   choose_functions()
> --
> 
> commit 51f98882bd7c33a728dede77756350958f73cb62
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> resolve_btfids: Tag fmod_ret candidates as targets
> 
> This commit teaches resolve_btfids to parse .BTF_fmodret_candidates
> records emitted by the bpf_scan_ir plugin and tag eligible functions in
> BTF with bpf_fmodret and bpf_fmodret_retval:<values>.
> 
> > diff --git a/tools/bpf/resolve_btfids/fmodret.c b/tools/bpf/resolve_btfids/fmodret.c
> > new file mode 100644
> > index 0000000000000..df44b93eea734
> > --- /dev/null
> > +++ b/tools/bpf/resolve_btfids/fmodret.c
> 
> [ ... ]
> 
> > +/* Choose the targets among the functions and describe them in RESULT */
> > +static int choose_functions(struct elf_function_list *functions, const struct btf *btf,
> > +			    const struct btf_func *btf_funcs, size_t nr_btf_funcs,
> > +			    const unsigned char *buf, size_t ptr_size,
> > +			    unsigned int encoding, struct fmodret_retvals *result,
> > +			    struct fmodret_stats *stats, int verbose)
> > +{
> > +	size_t i = 0, j;
> > +
> > +	qsort(functions->functions, functions->nr, sizeof(*functions->functions),
> > +	      cmp_elf_function_name);
> > +	for (i = 0; i < functions->nr; i = j) {
> > +		const struct elf_function *f = &functions->functions[i];
> > +		size_t record = chosen_record(f);
> > +		const char *reason = NULL;
> > +		unsigned int flags = 0;
> > +		struct fmodret_retval *r;
> > +		__u32 size;
> > +		int id = 0;
> > +
> > +		for (j = i + 1; j < functions->nr; j++)
> > +			if (strcmp(f->name, functions->functions[j].name))
> > +				break;
> > +
> > +		if (!f->nr_strong && !f->nr_weak)
> > +			continue;
> > +		if (record == NO_FUNCTION) {
> > +			stats->ambiguous_body++;
> > +			reason = "ambiguous-body";
> > +			goto rejected;
> > +		}
> > +		/*
> > +		 * A strong definition without values has no record. If it
> > +		 * replaced a weak one, only the record of the weak one points
> > +		 * to its body.
> > +		 */
> > +		if (!f->nr_strong && !f->weak_symbol) {
> > +			stats->overridden++;
> > +			reason = "overridden-weak";
> > +			goto rejected;
> > +		}
> > +		if (!read_elf_value(buf + record + 16 + ptr_size, 4, encoding))
> > +			continue;
> > +		stats->with_values++;
> > +		flags = read_elf_value(buf + record + 12, 4, encoding);
> > +		if (j - i != 1) {
> > +			stats->ambiguous_name++;
> > +			reason = "ambiguous-name";
> > +			goto rejected;
> > +		}
> 
> [Severity: Low]
> Does advancing i = j while only inspecting functions->functions[i] skip
> candidate records on functions->functions[i + 1 .. j - 1] when multiple
> static functions share a name?
> 
> collect_elf_functions() gathers all defined STT_FUNC symbols regardless
> of whether they have an fmodret record.  If functions->functions[i] has no
> record (or zero values) while a later function with the same name in
> [i + 1, j) has a record with values, the continue statement jumps to j
> without counting the remaining functions in stats (such as
> stats->with_values and stats->ambiguous_name) or logging the
> ambiguous-name rejection when verbose > 1.

Yes, you're pointing to this the second time,
so it will be fixed in v3.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261109170550.141443-1-a.s.protopopov@gmail.com?part=15
