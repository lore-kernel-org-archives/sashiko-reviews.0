Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728134040D
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341451; cv=none; b=Il09D8rkLs84SjKon13HgPc7Ovp9Z2R0n8u/AOc4bk2c7ji5QWrTRcggROGNbg0wsPwx0X3gi8ESPUA08l9j0Rb7t3jbLaNBbM+KeS1TyLnsSpJegrdnYyUpepT0knxEYnLxX6r1/QkL2DCtGIx2DQeUn0UZcS72Hq4QwPr8/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341451; c=relaxed/simple;
	bh=Dn4leQDbq1m2uRP6oBxoD4WvGafxPMKi/15ipQiHAi8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RszpmOgb3w110brh3KrbnIcDBFmmfhdLrMcZrxT4arde/FwlDKcgwPm+mR2dGwnJCr4jzuBIkDBuI6QbPxvG/QIrWdZbcpkUnpq5ukCztMlpMsnKDRSICuaMZUHAevpfFQVhWAkm0zrQUkTH1dGsAzelAfZ4lbUb2Xpe8MnTQtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAyx19q5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAyx19q5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e00eee27dso636929f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341442; x=1792946242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ua6j+thg4pXL7S9wJjMaHKA5Xj0iNYktIJ1108GNG0g=;
        b=HAyx19q5XTzJB4L+dB8hVDJ88md5njiPh4sNFYdZoAQIRVFYI/t8QLHQ1jBndcywSY
         FFp1jseIjjrQAqsZVNyXFr39EKhqd4nQ/+H4+sB7KEr5IcOSEHNx3x2Rt9fIlkL1xLPO
         ga31ktuvN/2MGPZUYVl3p0zj6MVwxKtvPSWE4Zh33yJC2GO7WohhOhXzKqe1LXA8jKti
         jq0rfSLlnYoW2sxMxhAPj3ije/95V/Jw3Byr3KO80/o3ekdy+UKPKqQpD1qW/Ui0Cf+2
         ouK0ABQII0DDMbLuKXI2AKqwcl5X2mOVjRuWlbjR8q1fWQOK3lMunUS2Ug871nZS0aXQ
         6H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341442; x=1792946242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ua6j+thg4pXL7S9wJjMaHKA5Xj0iNYktIJ1108GNG0g=;
        b=oB6USGmYuyj+RL0rPGdbAFBXF4eFrd9MoP82g4Vf75w7J4+7PJ/OBuDymqq+E8gBns
         1bSsL+95Xvtuq5PB3e7eEBFEetmxqfUcRUXGrdX58U+rl4pCAXB9zLyfEYQjhrrdJTp5
         Hcs99cewZKNLl/FQEnEhELhF+CBNXj4t6JtEa6yWnG9kNopFcPBEpsdmoZR7ZErZdjjo
         46z06iO4qqerh8D3e3xvmNCgrlMIZGKBDBzqevJUQt1g409tEim26WuCMym8nvVQC0lm
         JrhPATD0m5e4OVkUUekcmYpGlNBQUtNAH2x1AyrZPHnRCyHMakw+l7MfpRtQEhjjZeI/
         a+Pw==
X-Gm-Message-State: AFq9FYINi01nLpaZ89+giezekpM4Qjah6vTqasjjrvJmDtnU9YWnMyMF
	LmGNweGl+TjrfZWid7w+k7+XhA/bdMHBXFsUQB4mNpGsCjfeT0pTrgwZ
X-Gm-Gg: AYBFou1ug2nYOlUi3VURTMRln30zHnRzB26KtgE3yCaJKer2Ku79ZV+KkOcVIR+TchJ
	l4vRvqJX0/CKq/070dcANdpbQAB9vPUMXrhLyvMxjugQ3RBEewyaL/FaeR89GN34UTit5VNelF6
	726gKzMg2qbsLGaVkvOM46i9zI6RvrNdteFfOlvEWQqkOstITenHCY3BeJEA9XRXwxQyKcEp6SQ
	ljuUAEOW2kGzfrQbcVsXcBpGykrHMgGyISL8Bt/mZNXVqOflUqFFxZdt8cevL1ApPtVQq0VyzVe
	bbWmS2yleiJYkXc5qpBvbjhMmock+lObSiosTtdEYrRbMF6Kd4sR7ra6uY+qPElp4Wqah9ofvdC
	jDyhJX+bB4ZvuS8Ik27kpo/lHg9G30v4PIU0/btqOkzz7UPqMx6DBD9a/silLtBhmXxHh4jHbp8
	/lbZ3jdEpZg4c2MpxP/uNqrCjMQubXXPRbC8a4Ncjnn7u1oQ7iOCuOmRPYNd70tUtyeWxdW3x7K
	5HbY9ZirdlIYA2vEVpiU6UNK4OB85XzC4o=
X-Received: by 2002:a05:6000:4382:b0:48e:932:aef5 with SMTP id ffacd0b85a97d-48e0932b0d7mr10246501f8f.21.1792341442100;
        Sun, 18 Oct 2026 09:37:22 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm17651691f8f.45.2026.10.18.09.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:37:21 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:37:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Andrew Morton"
 <akpm@linux-foundation.org>, "Petr Mladek" <pmladek@suse.com>, "Kees Cook"
 <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, "Jim
 Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v2 next 11/15] kallsyms: scripts/kallsyms: Keep full
 expansion of tokens
Message-ID: <20261018173720.142adfde@pumpkin>
In-Reply-To: <sashiko-outbox-176255@kernel.org>
References: <20261018155206.132411-1-david.laight.linux@gmail.com>
	<20261018155206.132411-12-david.laight.linux@gmail.com>
	<sashiko-outbox-176255@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 16:00:02 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kallsyms: NULL token_table[].str passed to printf() in write_src()
> --
> 
> commit b464b94e58431a4ad1ec112c739d63f16547b8f2
> Author: David Laight <david.laight.linux@gmail.com>
> 
> kallsyms: scripts/kallsyms: Keep full expansion of tokens
> 
> This commit stores the full NUL-terminated string expansion for each token
> in token_table[] as tokens are allocated, avoiding recursive symbol
> expansions later.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 5603b2a6c77bd..9e1bc0fdaa9f2 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> [ ... ]
> > @@ -415,9 +403,8 @@ static void write_src(void)
> >  	off = 0;
> >  	for (i = 0; i < 256; i++) {
> >  		best_idx[i] = off;
> > -		expand_symbol(token_table[i].ch, token_table[i].len, buf);
> > -		printf("\t.asciz\t\"%s\"\n", buf);
> > -		off += strlen(buf) + 1;
> > +		off += token_table[i].len + 1;
> > +		printf("\t.asciz\t\"%s\"\n", token_table[i].str);
> >  	}
> >  	printf(".size kallsyms_token_table, . - kallsyms_token_table\n");
> >  	printf("\n");  
> 
> [Severity: High]
> Can token_table[i].str be NULL here when some token slots remain unused?

Probably :-(

> In insert_real_symbols_in_table(), token_table[i].str is only allocated for
> character codes present in the input symbols:
> 
> 	for (i = 0; i <= 255; i++) {
> 		if (!token_table[i].len)
> 			continue;
> 		token_table[i].str = xmalloc(2);
> 		token_table[i].str[0] = i;
> 		token_table[i].str[1] = 0;
> 	}
> 
> Then in optimize_result(), the loop stops early as soon as find_best_token()
> finds no remaining token pairs with positive profit:
> 
> 		best = find_best_token();
> 		if (best < 0)
> 			break;
> 
> Any remaining unused entries in token_table[] keep len == 0 and str == NULL.
> During pass 0 in scripts/link-vmlinux.sh, kallsyms is invoked on an empty
> symbol file (.tmp_vmlinux0.syms), leaving all 256 token_table[i].str
> pointers as NULL.
> 
> Previously, expand_symbol() wrote an empty string into buf when len was 0.
> Passing a NULL token_table[i].str to printf("%s") in write_src() causes a
> segmentation fault on non-glibc hosts (such as musl) or prints "(null)" on
> glibc hosts while advancing off by only 1 byte, which corrupts
> kallsyms_token_table and best_idx[].

For glibc builds it won't really matter - that corrupt file doesn't matter
and in reality there are always enough symbols.

I'll add ?: "" to the code.

David


