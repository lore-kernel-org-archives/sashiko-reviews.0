Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666735;
	b=AKwSP3x66Ndwx+H69zoPf3+t/0XB697uDYiBMDf20yP9AitvktskE74z8wHCU9Ou+ksA
	 Z+EBnPaHPcTz30u3t1fcEU/J54avPXeBD2FXmlCSY8pkL/s2NOf/iIoWSEo1yQwHsdM6e
	 gbr3KALya/0Fv/n/B0HlWTNDFSm7OaLmJf610SuX8qZSTh0/9GqoZRo3ol2SrGwHp15f0
	 t+iuX2neiXTR2NZFmOr7zr/gk2+jvzPRAu//k5LhZT2SOlc92UdOHWHZ0BI28+xsRXzN/
	 txKf7houRBR3Dcr6aPLXEvfgQT4htit7meQcZIxx6XN9OXEZK4Lf7lxjzxKz76B/7Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qWeCdWju2mIKB8UGaY5EcBwHtnHoPxgSD81CkBCW95g=;
	b=UNtDy2UMX5oDJtDXw6Ec+r9n4xqqpLK72wGQcpQoU6daqQiuS1U0sIc6sJIgGQl0wX1H
	 cauih8xTrtwsEyFJPmdF+Pa5/Bn38eAPOUAPsdi8xOoayBs3L4mTMfntrR3dhG1cr6PqC
	 08DMtdvRaNtznGN7tyyTRLTRPIm1vYzAVfoyVNtUms8Yb5PQqWHA4kiNt8G6JONNg9mWE
	 uhVXNwNj4aTHRAEkxfNcXovI7NaGNOi/KJSYmVjO9iC4KYB0X37sGxk0UrCwEsrh8eIrV
	 9LC3i59gxuF2SmGEO+d7xFKyKPcWqRUEbKhykU90JEp+QVYFMp7Pew9nRtYmlXAYouQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deJyLYI2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19281606A329
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 14:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19281606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deJyLYI2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so11507365e9.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 06:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666733; x=1795271533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWeCdWju2mIKB8UGaY5EcBwHtnHoPxgSD81CkBCW95g=;
        b=deJyLYI2sodM86CoTkQs7urxZPK7WYFB+/1G90IHZWoex+FHgHM9CZ11rfo7Y11RoR
         RFi3wJ0dhtY3wTjr3R6jr17voAtRdg/OM7zM5wACKC27puBr8pcvssXOaOMX5YQ/Is33
         QdiPWt8jdGcqCKl+RtMFJceEMjl+bBHsguEQsjYSdZYVetXUkUyBTzxfhEnrRejsTtXB
         bcs3/b5kXKeHDJDECXOMwam1rvH1Xfllehj38rfcXU3qBjGcQddUgvLFdzHddzkdN+6G
         P+iHUdNo0dv1p4RQuY7v0Xp3ZyLVNvuX1nPfSkOMuY/KzkpbhEs/sD3Xm25fk915IKF7
         yPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666733; x=1795271533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeCdWju2mIKB8UGaY5EcBwHtnHoPxgSD81CkBCW95g=;
        b=yXseeQTaEOcg2NIvaTARzmz4jXc3KZHthW/60X/2m9VIGE/Ztmc3qMRCe9Zy2x/sJs
         ZhR2z5FAY36fc9lzP8AzsZlyaMXJNIoTks6M9XM7THscaATup/S3FpX+UFPG+kfs7RwX
         uzekWjBw9iFjroyJWVZDztuWmUEOsTMVC+VnTFPNZnKuY2bxHJk7oUzpkPeTvKcCkqDz
         t0f/oxltI258Yz52SOBbTgijz7ArtxrApTHhPyIh6Xv0sy6UmlySf7A/mLPIoBA8W7f0
         blQTMLi+mHd0SEmTyeAcphnxbH2HjxU2dfwHagWmVJZhas/gb/Sm0sEMBkLwFbUmis0y
         5rng==
X-Gm-Message-State: APuU4Z+MREWQ4PZNIdLbCqnZAthODtzfG8/yxL79AcPgxdr+J+4YGSnV
	gkRS/N5AuMnyOcA/+6DIX8P2aHj92Z7Z5SdJDHD2fDbwL2D3ckxgm/2Yd+m0WPKm
X-Gm-Gg: AYBFou2llCXB6zYNUQnKLlVd2IbgQ1KQflr3ensUwMnS2y2K4CZ1gApZrvuI2rlOBR7
	PpNn86gNFFM3/bp6mA5ZHu8VqBXC+ii+b7U961qW8opuXQ/XxTBssZ4cqLa1Lzek/tWqZ1XJHYw
	DtllztVyCO+g0GoMJHJrIYHL9gSS0DU4qAcRi5qZIGSlEyDnzMEG4VEQ8+YMN0c6MHwZQ7GL1mW
	GHdqJpe3BJ24XQHnGQJTaWU/YqgI415YZC316Fqa/rEQfT8NCMFcdaTCbVn2CEgwM0JK1YwioG0
	0MPib9jpxCaUyhjkqjxwNPpCiScr7flGznVLyU5nKQxVkniNJtDGGMYgO/vr4J3seGrdZoILDZM
	nHv7zSROBvpuuyH2REKoEb6tEfximtJUDfaxRrCMFspZ1FoN6dm38XOv6gb937rcAhEgjpa/KXz
	CFaeNYmOoLUU11hv/yrZXu5xdItwxwzekgnD5uJwXOxgPnvD6DIPiRJV+g1DNEdcdLHZ56h4x9A
	+6p9yKYPMV739b69gZjpMkqocomjCL8ThQvrspvGuQ8qaB0eZGxYAnV+J0U52V9k1MuXoAvbwfU
	y7SMsoje5Kug2+ZbwLPj7CQkTmq1Dz0j6MTmDlhyb/YHOKO2CK664pE5nS0NCx6Z4Q==
X-Received: by 2002:a05:600c:2d2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb55a63720mr87539035e9.24.1794666733074;
        Sat, 14 Nov 2026 06:32:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm56702255e9.6.2026.11.14.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:32:12 -0800 (PST)
Date: Sat, 14 Nov 2026 14:32:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v3 next 04/13] scripts/kallsyms: make use of binary data
 output optional
Message-ID: <20261114143211.753aaba7@pumpkin>
In-Reply-To: <sashiko-outbox-208980@kernel.org>
References: <20261111115911.1142000-1-david.laight.linux@gmail.com>
	<20261111115911.1142000-5-david.laight.linux@gmail.com>
	<sashiko-outbox-208980@kernel.org>
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

On Wed, 11 Nov 2026 12:32:07 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] scripts/kallsyms: wrong variable negated for negative offsets
>   in write_src()

Will fix in v4 - all the symbols offsets in my build are positive.

> - [Medium] scripts/kallsyms: 9-digit buffer in write_src() clobbers sign
>   on large offsets

I can't count! Only affects kernels that are larger that 1G.

> - [Low] scripts/kallsyms: missing endian.h include for htobe32() and
>   htole32()

Will change since v4 is needed,

David

> --
> 
> commit b5cbf4ceba792715bcee0dd6d58ce67f9542a5ad
> Author: David Laight <david.laight.linux@gmail.com>
> 
> scripts/kallsyms: make use of binary data output optional
> 
> This commit makes the binary output file and input ELF file optional in
> scripts/kallsyms, writes the markers table in target endianness when using
> binary output, and formats pc-relative offsets into a buffer for fwrite().
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index aa3a8ec83fbb8..74db751600b4f 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> [ ... ]
> > @@ -406,51 +417,105 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)  
> [ ... ]
> > +		if (out_bin_file) {
> > +			if ((i & 0xFF) == 0)
> > +				markers[i >> 8] = big_endian ? htobe32(off) : htole32(off);  
> 
> [Severity: Low]
> Does scripts/kallsyms.c need to include <endian.h> for htobe32() and
> htole32()?  Glibc pulls it in transitively through <stdlib.h>, but on
> musl libc hosts neither scripts/kallsyms.c nor its included headers
> declare these functions, breaking the host tool build.
> 
> [ ... ]
> 
> > @@ -458,31 +523,15 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)  
> [ ... ]
> >  	output_label("kallsyms_offsets");
> >  
> >  	for (i = 0; i < table_cnt; i++) {
> >  		if (pc_relative) {
> > +			/* All 64 bit builds and (at least) relocatable 32 bit ones */
> > +			static char line[] = "\t.long\t_text - . +123456789";
> > +			char *end = line + sizeof(line) - 1;
> >  			long long offset = table[i]->addr - _text;
> > +			int off32;
> >  
> >  			if (offset < INT_MIN || offset > INT_MAX) {
> >  				errx(EXIT_FAILURE, "kallsyms failure: "
> > @@ -490,12 +539,28 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
> >  					table[i]->addr);
> >  				exit(EXIT_FAILURE);
> >  			}
> > -			printf("\t.long\t_text - . + (%d)\t/* %s */\n",
> > -			       (int)offset, table[i]->sym);
> > +
> > +			/* Build the line so the the faster fwrite() can be used */
> > +			*end-- = out_bin_file ? '\n' : '\t';
> > +			memset(end - 8, ' ', 8);
> > +			off32 = offset;
> > +			if (off32 < 0) {
> > +				end[-9] = '-';
> > +				offset = -off32;
> > +			} else {
> > +				end[-9] = '+';
> > +			}  
> 
> [Severity: Medium]
> Should this negate off32 (or an unsigned magnitude) instead of assigning
> -off32 back to offset?  Because offset is not used after this point,
> off32 stays negative when a symbol lies below _text, so off32 % 10 in the
> digit loop below yields negative remainders and writes non-digit ASCII
> characters into the assembly output (and -off32 overflows if off32 is
> INT_MIN).
> 
> > +			do
> > +				*end-- = '0' + off32 % 10;
> > +			while (off32 /= 10);  
> 
> [Severity: Medium]
> Can a 10-digit offset in [INT_MIN, INT_MAX] overwrite the '+' or '-' sign
> in line[]?  The template only reserves 9 digit slots after end[-9], so any
> symbol at least 1,000,000,000 bytes from _text runs 10 iterations of the
> loop and clobbers end[-9], emitting invalid assembly syntax.
> 

