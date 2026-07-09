Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F783A16AB
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628946; cv=none; b=dRRwy9yDv2lB8d2087JvisyueP/Qt/ESi14SDsSd2MuAfRd8zwF9oxS2GgmZwa+KTbQY70/6Ui/DXUjv6bLc5ZoAkbp9DHWCmtIK8GpWlmrUgP41ydaQizFGjamOdsB8XaPca25O7RWie8/ZvJ16SU2BOypO0z075ztgUh62ZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628946; c=relaxed/simple;
	bh=C/A8D3tbNyUg4sem/vfY4lMdGn+APIJ+yua/yZDMmI8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=KMVD1Q4SS/zzfredyvdGM8Z1JUR+9ScM319WAEQDGG+Kwhb+1xuYHotfy53s2qghpGgkLrZoMCCgaWi0JHl89WYLEfgw6dQxc7iDyp1dYl4oi87zZrBrspin4zvwDGwjZZNHcQtOaFd8uIweHRsHY7ztQHF/8EnVi5V26M8KqhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUK3YyFJ; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUK3YyFJ"
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-493e9bd9100so457015e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783628943; x=1784233743; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C/A8D3tbNyUg4sem/vfY4lMdGn+APIJ+yua/yZDMmI8=;
        b=sUK3YyFJw+5iE6yD1//oADlFCQ/6zSAcs8115goxSM0UF9flewlGH7RKul7R/TwenA
         J2f99+VL0haCX288FLIVUz3O/p0g10ZeezdJJxAVr/Id7KLixqv25X76/2WWbAUdb10b
         aaItXDSiJYwpZga62pHleIejfaL7Fagvqgu/ScHpckf84wrU5/cbF2TnlTluy2aIFsVo
         ZnWT9IRGDUnbPDeDOr8LTgx1VuCGxjVq5iuq07xGoVVyTlDnIxBwwSQn72sKZMNmrqNr
         jRxUhE7dFQbbiNSVtM7eVvl7APnZiF6Q/76qhAo0i5RWoSPM15r3ryFgi6BN9E6M7phu
         kncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783628943; x=1784233743;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/A8D3tbNyUg4sem/vfY4lMdGn+APIJ+yua/yZDMmI8=;
        b=G7rXQ5cnu42LXZysucnAHsyj279G7WR+KZ1kH5WuxDc3ocUPQNsOh3ZLF64FN458mN
         LnNVQKy1sQelnINI1a69wqiR1+wU3xFtw5gvS3olAijspyIdvf1SXISJJ6yeWmVcjoka
         D27BgKFk8PQcDDYOg/le8Z66waDPeeAXO72Mlu+DZOQvLLC8+J5333Vyb9fifzbUz9S5
         a2Ch5J4NPhWxVX2qtEMg5CyopbJ1j5iJS85dhfN4OZwOCwzbqFh0132gLu9UpN+Ai2wi
         yJNhuQ8gUsoGuhTVItLi/uaFnwv47Q40Z6iEaZd2ntADnSUhpgBTGVzCnOWZEGpxu+DW
         i+Bg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/stXL/UWzxXPc5YDE/4f+g7JCUtTk3pr2bod3BrXkosogOUPRX87hiMkZpMUbjYDT6boQJJjXt0KWmradgOs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeFgNRKvMgEnWZoXF/XuioBZUHRA2pHadCk/rq5+v7YnRp9oFj
	uB5l+3Z13l3PQmxqzX0AiBAGaBopEGQ5jsLKZnrmuOFilKRviXcOSoPA
X-Gm-Gg: AfdE7cmpz8Zb9lEn7twwPLUaCy+jh5jiwmOEpzfMqbXifN6om11Rv6N4EN7LZGKLtYd
	m4uiMPO7OmC/mx2oA5P53ZlCVy/DEvoytRNVeoyBORiZZScr62y4PAixHNmIclhmBCECgvHhWSH
	7B3treqHjryiiKdWAe+YdGxsRVqh+De5GEkRvX65UixoAYth5h1iTz+uprEyyS+0jqjVBaZ40GH
	/mGKa60+9dq96iC8ZaoMbJgu6e2JlQMGftTDKxEe5fB2wyVDMNcluTLz9ISzrb3pHcv6p0KvGKm
	w3D9AzgPFpYA0DcvFqNHUiw25zRedKiHsEV8rYxpSRqAgLTi9+xMCIAW/QkMc7VtUR9I9bS6rlr
	lh8lQbZQZW6cH/PBA+GZO89Tb+YUeyFnPzIrXs3m4JSUzfBVSTOe425TadNyrRri83GxffQX0CB
	clG6ZJz07Ao3MDjtwX5zS4V9HOesS5GJJsuSG4pwiobcEZ2TrCTN1FcAcOkPEmVhDteIxB98wH8
	nTtGctPsrBwZgmtC5iWr0ltKeNpep8SWhI8i40xb5eH1kB8GcGALok=
X-Received: by 2002:a05:600c:8a1b:20b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-493e68a4fe3mr67606855e9.38.1783628943412;
        Thu, 09 Jul 2026 13:29:03 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f2e56sm105405735e9.13.2026.07.09.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 22:29:02 +0200
Message-Id: <DJUBOWHO347N.1EKHIDMTB7DSA@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Amery Hung" <ameryhung@gmail.com>, <sashiko-reviews@lists.linux.dev>
Cc: "Nicholas Dudar" <main.kalliope@gmail.com>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: reject rdonly/rdwr_buf_size kfunc
 arguments that exceed u32 max
X-Mailer: aerc 0.21.0
References: <20260709155837.1879230-1-main.kalliope@gmail.com>
 <20260709155837.1879230-2-main.kalliope@gmail.com>
 <20260709161557.794E01F000E9@smtp.kernel.org>
 <CAMB2axMeZbxWry=P5JTVo_xDw7TUeUKdK6X0_LKjvLWnLJyHMw@mail.gmail.com>
In-Reply-To: <CAMB2axMeZbxWry=P5JTVo_xDw7TUeUKdK6X0_LKjvLWnLJyHMw@mail.gmail.com>

On Thu Jul 9, 2026 at 10:01 PM CEST, Amery Hung wrote:
> On Thu, Jul 9, 2026 at 9:22=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] 32-bit integer overflow in `hid_bpf_get_data()` allows arbitrar=
y out-of-bounds kernel memory access.
>> - [High] Explicit 0-sized requests to kfuncs result in out-of-bounds rea=
d due to verifier BTF fallback.
>
> I also noticed the second preexisting issue when working on a patchset
> unifying helper and kfunc handling. The patchset will fix it.
>

Exciting! Are you also planning to unify global function calls (and extend =
the
type system so that we have parity with what helpers/kfuncs can take), or i=
s the
scope only helpers and kfuncs for now? Just curious, but I think it the
unification would be a good base to bring their argument types and the hand=
ling
at parity with helpers/kfuncs.
