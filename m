Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A8633C502
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743236; cv=pass; b=GldVTl3wc7rdpDuv7dfVdT4TW452PO5K+JLjeSjw+b2/0EAx7MSl3tshHcjc0zUBYxdLsbs+UkaJVEjrwxi9NG6w2vmi8vtEeOiSPkdRmTumQZHAGHmfj5o7OH75Wa8I6KQ1YQkrUGsby0nSOnNTeLe07PRfXkUNDa7p618fId4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743236; c=relaxed/simple;
	bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKD1QHvKI2stzGKl/bfNn0aHa6okq7bRHW5nDtHSmWQjMWx5/btiQql8TvIwY7MElcLZ8732R9VwV3UMAJeax5tOb/6A60jnwD5qcHgu5cF8H+fearyNMB/aSPA/iT29aszyaoPBZOZ6d77yOM2eNTvcLFzND2RUnez416UdaQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fm07JK97; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fm07JK97"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69a33fb0031so199806a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 14:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786743233; cv=none;
        d=google.com; s=arc-20260327;
        b=hvsSvR+kbSPeDRHGTUCR1Yv3oupwUJXTyJmpH47JH4LYIcLmp/gMklMP9wOKBLquT1
         z0xPdPlN6CKEw2JzjxGpyvLBiEMtViibw8zaHNs5kgDm1kmKGfeLr3V1nqlXAYRyxILP
         H/E/C7EKxv2xnNp/L2G5Muyp7Jp9rg536NSawW0LtSf57yK/K2BRj9jUtOKiUPBCYofB
         yc0x8whnX0WmEqtx++Zhcz9o0aSAt8lo8rrs//NITc60MpLUi7DH9oKyQxnUsmwpISG2
         Zgvj6YbfDFFVik7WeyGQdwRf3olhrIHPWgWYLlVxHMQBKrVnqPTJ1vHKuZwwZlZRv5Zo
         khiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        fh=iPERcR2270DHwjuw++KJ4U1n/KGPryhn7KXnUKY8lzo=;
        b=KLiDpFzxAt2INSuhaWndyvFRVTh1ef6tJ8VGrXSONPSAaa3QBetiuEr5rpX23RCNm1
         97vMyMImp6PLin8GfIkNOb7W5RI38puCnzW5cLTtoTVdq52sQwAVx1Cx1LnXn4sJkB7L
         XlR781gAiHgxEgxZPiDyVLpSkSYCMLDHiD72ZMKkkmxHOZc6J11bqx2tW8hicIjNvk0H
         LnpJHx6HDWATECAawRUHGkMWo7u+DdXIq8Ejs5dspUoDg/WCe6pgrcBScxV+hDA6aVwv
         sztVpf6OgxFo8O1RBUDZFy2UaGOMyZa8FB0GpjTIj88WAALSaylspmk4jUbfxlz8Mi3/
         32Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743233; x=1787348033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        b=fm07JK97OK7jlIzf40ewuzaJ5o2/xJHn7SjeqM4ByLWw4iEhmO239/Hz+d5Gp9cGK2
         cP0OKSjPyR3sadfu3kOD9rlYJLi6FJj1k1pORU/5K/82sNbY3Pj3Np1Xd7U2hwk2X2Zf
         ZeGf4V6XO5VUafHGD/Uw/Gwz9T2VxSXADdOWmh0IEZMcfiSJ41BpBLVlTXB3eDpAf9/K
         5gkhAC3pUuB3ZifJmvfRGopficiyAQ0I47Un4dtujILkTQUALXbT+nPOzWrUrBnMmPEM
         hO7mdyoRjzQhMxYSQh7UhU5wExGbK//EuUv2AcKQclfWZvQM9j8NUPmr9FJEWjHo+Y7g
         9xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743233; x=1787348033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bF//maFhRDVTJClT6VlIKy7W5yILeHbfc8S+gFxhrTk=;
        b=ED6yAT/HR5UyfikUFBqjh+JvE1E6N1enFIkc1EHMovBGnT5yxXIy4QuEn4TxIQQ2ki
         DQyT5kh8t5HRythqxuH5h+g+Slg8TG8bLLrCMRFQ8+RZRiUEknm9f4TTvKRA/uzpGlyt
         rInNg27NBAk18tlBqZllQ/6fKRA4Jvqg3ZLqbpWeqjt6RQ9XVcc4crDO3YYJyBjyZt2Q
         D1zAbX+8jgnCT3SxdRki/i8L0UcfqUeofTVzLme0P+NXZzwvfh0if8Y+y8kv4vC21skF
         9e048IyHVZWfm7lh8DtiKbdn/Xofet9yMeIsPIHWzOPbCZVodN0stGfiDrrZHcyWGxr0
         Aniw==
X-Gm-Message-State: AOJu0Yzs+zZRtUZSJO8w16LjPNdraeIe/YmZycfE5muivJWb2xjWzZ/o
	lUKodk0oUPtr1XdzoqWbVegp6yJ77U7bdtcA/Br9wC+JDoNqSVAuSabeq/6KdckrfFbz6UX8PgW
	tRRilxzh/46E8WBOHscVUGb08K2Od62Ea6w==
X-Gm-Gg: AR+sD12qUGciCPzQysYhtUg97UiA0PcRk/CACGftEyHbCHQeHrkATWPi5gNvsaJ1a/k
	VZjmcS0NPov7YXFEQHoB8JQ5YaIFoFf1DN6DAf0Hahe5cnukOxEaag/aZdr+Jrulel8dNWyMrbW
	J9MU5G9THDNeVa4q0J34GASkY4P+Y7iKVTKxoG5CM6V9MWVx5vUUjSk6LqMx1F1tVhAMfNw79ww
	rU+rMbT9zs+6JLRT19WhHbxUWtsVAk2NhvqITUDydejb51or65dafQbp/VSvm+aJU97OQcRJSLS
	YT+8+WbF9kzYoLQMXGhtQKxVfgvra+saLGf/GQgYMVCv5yGcU9Kp3p3vF729q+AWrSlJDY6GINE
	+IcI=
X-Received: by 2002:a17:907:3e9b:b0:c12:732a:fe52 with SMTP id
 a640c23a62f3a-c212a26d6a6mr212990566b.4.1786743233242; Fri, 14 Aug 2026
 14:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
 <20260813164117.DE8F01F00A3A@smtp.kernel.org> <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>
 <20260814-wild-dog-of-dew-3ccfe8@quoll>
In-Reply-To: <20260814-wild-dog-of-dew-3ccfe8@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 15 Aug 2026 03:03:41 +0530
X-Gm-Features: AcwNN1Uy44KKTceDwDiBJV_p4AQtngzimLEUMzkno-EHQhuKCEBgyeAvZt7maU0
Message-ID: <CAOWyW_7NL1GeWCTu5LED4avsRLMOHMs1kVxGN0r+MxMhHSj_AA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, robh@kernel.org, 
	lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Thu, Aug 13, 2026 at 10:24:12PM +0530, Bhargav Joshi wrote:
> > On Thu, Aug 13, 2026 at 10:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [Medium] The schema enforces non-compliant, legacy device tree node=
 names (containing underscores) for child nodes via `patternProperties`, bl=
ocking the use of standard generic names and contradicting the commit messa=
ge.
> > Yes nodes with underscores are kept not to break older dts/dtsi files
> > which uses underscores
>
> No, you made them ABI now without explanation why this is needed.
I will fix dtsi instead of keeping incorrect child names in binding in V2
>
Best Regards,
Bhargav
