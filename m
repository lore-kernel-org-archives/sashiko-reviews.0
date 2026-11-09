Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230101;
	b=wLpo/9oyBCkU02tghCTFfq2ls2FZzhzadkH8M/rK6gRTLWtnsHV9o0XvU2nj72syQFpm
	 cLdcdWEDZKF2Kv3M+rurB9j+mdUqBROQOtKtqcRSV9hXyDWpxnmAPxZkIzpiI+KckRerz
	 dwc65XOmxvaH4jT3iV2/WeURyjlZvhijUlL/Nsge8u48PXgoM8SC5mbtKXc9QXCJ2jzBp
	 HTZ/zMCMIGNHy8t+hH/Ja5rmS8MmPxT4FkhkJIJnZvsg7S9yDNDjgqYhUBAPXQXlaTppR
	 eOc9GUt1t5uRKSPtYRfzwNwkwiZbOREhTJWqXdbqDAwQUE2mEwEZO6BwuU4cNYQjNtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=qGVRi8XeHmRiRp7mXvZ/UI22QQobRMG4w7o25Ae4/kA=;
	b=wkWUHkoomaYYmn8ivkLJ1l3aCon/FQXrsGU5k0h/aWMsmxAPT8R740UOC884R/+3vEVW
	 LDhaHqyL742Stv7NVf0rL8UNlBXmfCHG5fGPypxcGKSEhXFg7zTsmOK50lStM8BuCxAsD
	 CdmtebbacnoTa4pns8g3OqhxuOo9OVqB1IIaiaYr9S2EoPNceRIT6hkSkn/CN1vsr50Uo
	 AnMO9PR9eGwLGVnRsV6cFQNGEbhe1MADQmdU7/deO4E8oLpW7oWhJiY1/DKktItUukD/4
	 tLnoh2nENTAi4+Ou8NFpgOmmtCfCabFiATqM/mxllsQCIiwfEOFrIXhVC1RFcpXaJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ceO24OwF;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FC606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 13:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ceO24OwF
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so117163066b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230099; x=1794834899; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGVRi8XeHmRiRp7mXvZ/UI22QQobRMG4w7o25Ae4/kA=;
        b=ceO24OwFFPbef+0cIrjU2UcHtO7b4kSVIplqjxvO4R2pzxi4r5VndZCxm1WRBiRJ0W
         NVt9JWL1bjGBlpECvJRofEY6n0iW9tD87mCLxdE1A0hIa00lV73Fb2RKUfQlyTmxPH7y
         SZIRj29V92cGLGYxBU3UmlexTAUl+GlUQBkYNjp9LKYKZSy6MtnnDERzEPEQCCQcBWbV
         BoRVE8g8l4jjPcGuWqLn4Ze7TSQXIZtIGsLUbYtV1OBiS5xu7i3s83Y7zqtIBeEWjiFJ
         bqSTPHZb4CUGTU6qduyq3bc5LflbuOChcx7Ks8uSh+NFbAFtlOAwuGtbAL8SKlLTXBck
         E3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230099; x=1794834899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qGVRi8XeHmRiRp7mXvZ/UI22QQobRMG4w7o25Ae4/kA=;
        b=BRFyf6Ol6/zKd60mp3ubX4156Cc9UhKEpQPO92JBqat4AIYBKT2e2PcEEJ214nKf+M
         gTYTZAG67/f6CzF2TuUKFNxuok0dsGD3M7m3bOY98reuMHUymHnAaUYwKeD88M0sD2Cr
         E/A5v0xHqhTD+SmyWbIOEK9t1JNXk+1MJgFsxuxgx6xKpfuE49PEQNT+6G9iFpyOMr+0
         U7pB+IZqqZVWTMFV6JlkSA8jWp0Yx6hgPvlPxHC3lvH+nY1aRKKv8s/8PRvbMCupmmAN
         HkQs0uFs2Pz10kUknupJYJ8a/E6au3mZbgHkRunBZdqJ9s0RIsfHaD24Na2+zybN/M3h
         5OZA==
X-Gm-Message-State: APuU4Z/dw+DIQn5r3F1sxHIUt131tG18U2NOIKcNayPTmfZ7t4+tyhhv
	f3n+Ip0OoSDamOPuDb/32TjMeZY+OzjBP8nhjuHh3JWM2y5P1ZJIbpqVGVFIgA==
X-Gm-Gg: AYBFou3zE5fcGTzN4AlqBR9Xo75EWRquEI4wqSXqsjy95FTwy/ZzCJKVkyZmjRFGYuH
	qWjj0ze+82BOKdUTHTuLnLjNasuGVrLfW85qpNcgXPsdiAOh7c2Scwq9rziUbbfdGMaNm8OcUud
	Cks1+3A7km6S5YdTi5CLALoNrEZVjapROz8Nb3yNw+p2IX9nfFxFuRqR2hvbOAEzTQVyd9V2rQv
	Es0WQUFKfVRHFsu4PTW65dmu+qnv1yZybefB46n3Vp+iCoRwts/Zo+TnHcARiWQ32qo4PCEZxUN
	W069Rz1ViCBUZP8a8grBPYwIliqqbeL1N6NnToe7zhXORSD6ytt6dMfcL/eNXmh7lzxUddOadnc
	MFbtgbChWTN7WeUzr2PHW/Ih2lJS++bPbEV1PcWHjDR6lAxFwDapyYcFzO0s1YMkkqgOX0YF3Nx
	4vDjCDAb7Xke9+foY1KhzSs+H8UrOOXpFsuadPeOPW2m3IiCTtzkcsobeyhhsK8RMyFzQnpm484
	XVnEBTF4udbesCdPbdmPZvOSfxGs640v2/BHOu84cW9fkkRoWBeiQLMC4UcxAiItEh35X48O9kc
	pLRJstG9CRIJ3EeSD2L0x5xfLf20N6OCY67Y
X-Received: by 2002:a17:907:daa:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c4d6db217acmr336983066b.21.1794230099175;
        Mon, 09 Nov 2026 05:14:59 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d68d53b9bsm173722966b.10.2026.11.09.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:14:58 -0800 (PST)
Date: Mon, 9 Nov 2026 13:26:32 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 15/18] resolve_btfids: Tag fmod_ret
 candidates as targets
Message-ID: <avHKCIvezIs8YjWJ@mail.gmail.com>
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
 <20261106210314.1767267-15-a.s.protopopov@gmail.com>
 <sashiko-outbox-202290@kernel.org>
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
In-Reply-To: <sashiko-outbox-202290@kernel.org>

On 26/11/06 09:14PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] bpf: resolve_btfids: choose_functions() skips records on
>   duplicate names
> --
> 
> commit 592223df16723596e1694e3167578ff1cfdd0320
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> resolve_btfids: Tag fmod_ret candidates as targets
> 
> This commit reads candidate records from .BTF_fmodret_candidates in
> resolve_btfids, filters eligible traceable functions, and emits
> bpf_fmodret and bpf_fmodret_retval: BTF declaration tags for them.
> 
> > diff --git a/tools/bpf/resolve_btfids/fmodret.c b/tools/bpf/resolve_btfids/fmodret.c
> > new file mode 100644
> > index 0000000000000..1c29ab9a8616a
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
> Does choose_functions() skip candidate records on functions[i + 1 .. j - 1]
> when multiple ELF functions share the same name?
> 
> add_record() attaches each record only to the functions at that specific
> location, and choose_functions() then groups all functions with the same
> name into [i, j) and advances with i = j.  If functions[i] (the lowest
> address instance, such as a static helper in another translation unit) has
> no record or zero values, the continue statements skip the rest of the
> group before reaching the j - i != 1 check, leaving stats->with_values and
> stats->ambiguous_name undercounted and omitting the verbose rejection log
> for records on functions[i + 1 .. j - 1].

It's not a functional bug, stats may be 1 off,
but this is not verifiable on practice

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261106205523.1765622-1-a.s.protopopov@gmail.com?part=15
