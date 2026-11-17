Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913576;
	b=IT8jcGTs5w5iFYrkFYTUrC2RuldDScnfxlrsMoGR//Gj1cYBJewDNB2PPSTiC5uLQj1I
	 kqt5/J09UI+VyivPu0wk/Ntsn1gAlUci/WhUspHR3KnT5VnbVmN8TpH9X7hKyqj3JWLg1
	 ofX9bRTpdVN8p9yq+lR8Ht2YnAfZhPgt23KTKlnY+vNmaiMfN2v21SrnWnssLx9dUgkBO
	 K586UPkrefOPEuXeU6/ifM3H4ItXNTSrEalt4OSl1qv+csaj9vE6o+M+aUdPeckhgavfm
	 6iK0ntg4ydBY9VUW/hcSyymZuSFuhjfljez/sj+PzPJGyl4UPN2i0cAyn8DFnxdF1kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ChkKaHHAKUklGidpwJFPREnCjwZb6wuXyqrdGtCbZ5c=;
	b=jdfjSGszlkC4Gkp5CsO8i02YQMJtqjwC5QWz3jpQ/okMzx1QoJucrWd1Er6/hn8fNxQP
	 HuK1OCwXSf/oo2XjxIZI4yVczaqYB6oe8ihawUMP5FV6WN4reP/ICZ0AuKxn3vVcEliK+
	 pPIJLeCaVZHy+NWN+C2isoAGQrXhank+yEiHsbD/bM8NAhj0ullZpktsHFyZgnvhBLbHR
	 8KuaYgb5Ei8Vq+K2F94l8NpXUVqQuKLsNB1bpb+Q9rrkXThqfMnNULUtUFYvU6T/czeeX
	 I01NO3RZzUocNS8KlLpITFyjUkYr9X+VrM3uE4BIDzOPgvSwYU8U2Ve4V5+QTUIXNRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FIeSbqCN;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3CC606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 11:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FIeSbqCN
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3edaso539598f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 03:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913574; x=1795518374; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ChkKaHHAKUklGidpwJFPREnCjwZb6wuXyqrdGtCbZ5c=;
        b=FIeSbqCNm93NLYXTOFeufi/I5lkzpNs69GvBqpnMiPwgO9+tXGV+3EZ2FlIl2d1xiR
         1ghrGEDiNQBx50nN7Y63icSXNvuzH0bZ5Edd2PFlZ06I692cnzuuIMtvLB4xb7kUw3aK
         //YmSNk4AXO6PH2VWnY/j8XmfDyrnOOp5NvjE5Y2pfJL8fD9R5wTZ4/14EO9eTbY5m7W
         U1/95Wls5EXqwdqKK6mSRs+qAKGgOq3pk+SIg6EjqrIqjeQyjMpucklxnKTgRtogSxL3
         ZyEsqpabLL52RACAopTHG6cQyoFULSe5ZIWXJzB2hzbbFf2ECg2TDax4yRdnDF/zn1bf
         H+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913574; x=1795518374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ChkKaHHAKUklGidpwJFPREnCjwZb6wuXyqrdGtCbZ5c=;
        b=DvhNbBnZrtKYnMMA8ygdgGj5NUAfddOSn+U6YMdNieBX8WgI+mhBEIgFDiQjqOEyrA
         34kvYFOezg98uqqfeOB+xXGneJStYbDcVAfzfflMu0rDr4B/WDPnq/qIsjWXd4Nprf9h
         gt4wO6Q7S6JHLGyTItZmVQnGQ8qm5xEFjdyss/RGmvyTMImacLGLMTylOoeNnJP280R7
         UOgts6QD+NkiO3XesE/eARKe2uzvt9uA6yH/LKpqNbSxZmeAAvOw8YZmsqA9neIlF9Bu
         DvQ24JWu0y/6UX0Y30rOcWbR0tycMc/G0otUoWrabZSMXFRjRRwMCMThpNdI0sTaktMv
         GrVw==
X-Gm-Message-State: APuU4Z/V//K6VoSrb9Ue2ipfQMHSE0NewDlun02GVZrr8hP80E+PcgjV
	GpFkxUWxBD2iyLNYtseiJJH5N2bw002C/O8DOPuqFes1H2/czuFSCXaR
X-Gm-Gg: AZFdTZcTBNt0A3jMGVGU0FTT/aQndxXd9ob0MnpbRumnKjgTSRgs0UHlWmOl/zsALmj
	gf0B4xrD7Kzz9bhopkAkW0JdAFOkF6JYBfpZkFVp5jUcyuwIIvh9bOyQcJ+8fXvizroWS54FQEL
	xGEMffbmHNYkyY7fTHG3muWUizvMiDmhQBj1oc8b8cMUxKUToenN7Co7sTJqH3LNtOEapHNQDun
	q1MKd99PRV2PiOOtaY9pawcA5ux4k9YgRMaBgG/zLKQ6fXNwzHtfxoj+q+v/VqD49OI3riYIJBx
	ehYGiI4xpmk6JEirieFCoZqw0vrzkKJzhmQLi38TOva2rwAFkNnjMtTi/N5Xa88uEMmfTptKjst
	yPFTHV6hWnlbnUIrh7cXeKyQvyMPCD23/wK9I1Ks1qaMNrkwhrNiZQEt7zcnOtJKgkS1QhMfX9S
	dAl1QsxVVi5F5JeOQ5QBOiNxYwgSwilhZo3K5vTYSPiMQO0erRLp1EngwzIqMwUgrEQs8OLSFrN
	PH7SZe+HvpNkPDKeff0LXR5fN+qYRyzJ/po3uorjCLL1b8jyIBu1cnlaDQ0AywVjt47qgEfKXNY
	dnLLTS8F2o42JAIxrPwDdfpCjFldg5OxsMiqsH6KfiApbIuFuQZo+BYAoaCLfxsYzQ==
X-Received: by 2002:adf:e18a:0:b0:48e:3c5f:a24e with SMTP id ffacd0b85a97d-4a3735b4249mr4831257f8f.11.1794913573701;
        Tue, 17 Nov 2026 03:06:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm27345536f8f.12.2026.11.17.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:13 -0800 (PST)
Date: Tue, 17 Nov 2026 11:06:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v4 next 13/13] scripts/kallsyms: Reuse little-used
 compression tokens
Message-ID: <20261117110612.1d61025a@pumpkin>
In-Reply-To: <sashiko-outbox-218682@kernel.org>
References: <20261117103352.1244657-1-david.laight.linux@gmail.com>
	<20261117103352.1244657-14-david.laight.linux@gmail.com>
	<sashiko-outbox-218682@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 10:57:57 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] scripts/kallsyms: missing syms update on split in
>   uncompress_symbols()
> --
> 
> commit 33aea03661ccead3785f7f56d31a3c8974eb8710
> Author: David Laight <david.laight.linux@gmail.com>
> 
> scripts/kallsyms: Reuse little-used compression tokens
> 
> This commit reuses compression tokens that have few remaining references by
> expanding them back into their component tokens or three-character strings
> when a more common token pair is available.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 42a7c99585c56..976b525c4366d 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -855,6 +954,125 @@ compress_symbols(unsigned int token_idx, int compressed_chr)
> >  	return subs;
> >  }
> >  
> > +/* Change every occurance of idx back to token_pair/triple.
> > + * This extends all the symbol table entries but frees up a token. */
> > +static __attribute__((noinline)) void
> > +uncompress_symbols(unsigned int token_pair, int idx)
> > +{
> > +	struct best_table *bt = best_table + idx;
> > +	unsigned int sym_idx, len;
> > +	unsigned char *sym, *p, *end;
> > +	unsigned int substitutions;
> > +	unsigned int third_char;
> > +
> > +	third_char = token_pair >> 16;
> > +	token_pair &= 0xffff;
> > +
> > +	for (int j = 0; j < bt->syms.cnt; j++) {
> > +		sym_idx = bt->syms.sym_indexes[j];
> > +
> > +		sym = table[sym_idx]->sym;
> > +		len = table[sym_idx]->len;
> > +		end = sym + len;
> > +
> > +		for (p = sym; (p = memchr(p, idx, len)); p += 2) {
> > +			len = end - p - 1;
> > +			if (len) {
> > +				if (third_char) {
> > +					/* Adding three characters */
> > +					adjust_profit(sym_idx, idx, third_char, p[1], p[1]);
> > +					memmove(p + 3, p + 1, len);
> > +				} else {
> > +					adjust_profit(sym_idx, idx, token_second(token_pair), p[1], p[1]);
> > +					memmove(p + 2, p + 1, len);
> > +				}
> > +			}
> > +			if (p != sym)
> > +				adjust_profit(sym_idx, p[-1], p[-1], idx, token_first(token_pair));
> > +			token_add_symbol(token_pair, sym_idx);
> > +			p[0] = token_first(token_pair);
> > +			p[1] = token_second(token_pair);
> > +			end++;
> > +			if (third_char) {
> > +				token_add_symbol(token_index(p[1], third_char), sym_idx);
> > +				p[2] = third_char;
> > +				end++;
> > +				p++;
> > +			}
> > +		}
> > +		/* sym_idx is already in best_table[].syms from earlier. */
> > +		table[sym_idx]->len = end - sym;
> > +	}  
> 
> [Severity: Medium]
> Can uncompress_symbols() leave sym_idx missing from best_table[].syms for
> token_first(token_pair) or token_second(token_pair)?

Read the comment - it is still in the list.
Quite subtle.

David

> 
> sym_arr_free_all() clears best_table[ch].syms.cnt when a token slot loses
> all references or is uncompressed, while split_token() only checks that
> first->str and second->str still concatenate to bt->str.  If a component
> slot is freed and later reused such that first->str and second->str still
> match bt->str (either reused for the same substring or for a different
> length split of bt->str), its syms array only tracks symbols from the new
> compression and no longer contains sym_idx where bt remained compressed.
> 
> Expanding bt back into those component tokens without adding sym_idx to
> their best_table[].syms arrays triggers the errx() in check_best_refs(), or
> leaves stale token bytes in table[sym_idx]->sym if that component token is
> split again before check_tables() runs.
> 

