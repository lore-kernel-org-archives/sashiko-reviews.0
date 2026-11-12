Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471702;
	b=INrHmbS7QE06BziOM3M9MrDeX3bxxZIU6/G8+5ewNA2sFOeTr/hu80UvJIqC3N2TseZc
	 /iKesIcggQnblyzzZDtPORpWbW/wCQ7kMw61yBIsTZglcX/C7F3y6HPy2yLxzDS3jmh6u
	 AHugbJ/I/7F+Qb1Ou9ZqYWGFW8xNvByMgf3LknI8tbEZXp6t6cJSBsl2ObntkF5TthzRi
	 jMlNVK7W4WYfT0UNdprFFdpDOQTvyegZ9vnZN+IqdgYGX38A9kAgQwWpRD8lJVLJCohEF
	 b6pEv+p5p/qeRu2bJ82dNM5R+0+5UgLP6f+pYVyP3UtlhAYf+KcO8EuRIjxTD3OOtQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=H9uaLZfi8G3xn7U7LA390N2chRGYsitG3pmueRYFJa0=;
	b=lPbbYkYA7Q12pSSaQsdRMVgg21QW0FPfSAmBxbimLmWJ1HrgFR2xmtuR50lJ/4KC3QUz
	 qmjO/qsWPJEdyCe9DuX7AvM1DMjOtZqsWQCeuB3JHdsDq8gjQQ1Wd82rfNMXtrlVxbE9/
	 8uZZcRoPRh9H5Bw3pu1PkT9r4aszXsMY8mbc7w/hQtxb9G1cigDAHPvnvgeuAsqsggwxp
	 jaoUPI+kWfTGEXBUApvdp0JwA8HqaUPj0hov5izeuZJ+zcLDyIcYXZr9L+hPRr5j1Wazq
	 68UGWvGNUMFqrGreNS1ILG21GM4y86Tz/TnreC5jLkRzA/TxzfPJoO3GCV2f/ktqHBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=Q3VQVx79;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAAB606A327
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 08:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EAAB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=Q3VQVx79
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso378367c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 00:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794471701; cv=none;
        d=google.com; s=arc-20260327;
        b=JcX167U8b/z5G7lMxu06+Nx/yw5alDaAWICevmyULk1gLiV0xgMRvkxsNdvMMdobhC
         E0aRh/pDbN2IDWf8JMK1NfdNsNINja9n7x4u7Dk7ZmOiUE2Fb9csNwi1Ve/92o0lC8ch
         pGoLMaSmVs+zjNdc05e6Fhrry5j8t8yhQCHif8qExFVq49tLiQyvZESEuBIt+uljk4oh
         NC7uXdJ2Xw33/2fGGGuawg0tOE4b7aAKH/8MT8KWKxqefIRVJeGNoTLRq78vSpjIy77f
         qlR5Kl2ezS/reZlEj4VFwGZzt0plEsrfufkGI24OEmB///gEEsBeiBm+YelTA35xDWa3
         iTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H9uaLZfi8G3xn7U7LA390N2chRGYsitG3pmueRYFJa0=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=bXaSqu6+g4qdMCAXSYEE1qSZbYxfj0UjRT0Vljy27S6W69oOCITyRKvwaj66YH+ZgO
         LjDARYtjPBYokQr8FcrknILLVIaFRc4jTkfK6+Dj4Df7Bnwd55PGAaslFnevnsYkRing
         VPv2X67zNUgcPuGlrFC9nK8rpU0urvGtXx2xB5wxGlzStzd6/h2CwiTA4V3c/p/c2UAl
         3UUwFAiv4J0T/YnW8X9wDxZLmfKMSFkdM/6WapcLb5up4QJuyJJK15ESxzN8womIrzuM
         HDYSq82KMgaqVmbMsohOcOoCuQ1gZ9LzqN4y6PRYobdkzdXfcGxRfry91COr+wPalgAU
         u7cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1794471701; x=1795076501; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9uaLZfi8G3xn7U7LA390N2chRGYsitG3pmueRYFJa0=;
        b=Q3VQVx79upc1kS1zpNikptjHYJUIVubk0qaGPVIHbfFf8wUknZi6vRgF+xMHQZs9J2
         Em2Lk7vHstZyCPzR+Ah1oay0QnAr4HmAzsRPdIgXYUhsvEYNF6F/u2A5JBvhE0qdwAXs
         o/zqe0F5QmN4YD2BapY88YMpYT6N8KTr3GxLDBybz6ZPtkoGtXY8yhqEk2y37uPr+Ztp
         iOyahChpepJhxphQVygXalMhO7wKwEUeU/VirEDrylDo4YJ5zE0FH4rC0Dw7vm/AciKC
         u86uSAi+WosCtlheWCf0oTnQp7/RLE2IArdrrIKXgMc5EOFR6K6u5AaeNo2yzhvdlOmC
         lsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471701; x=1795076501;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9uaLZfi8G3xn7U7LA390N2chRGYsitG3pmueRYFJa0=;
        b=FV1AzQdzU5ZiY5BYf654V1m5L7CcArFxoHKpDWypzKB0wBc0DToNJxD9tj+D7vwv2S
         XxxeV2ny1UnANYl74siJJmQJVitAbou0J6eJ+KLFRV4+uzmUnxY+404O/sJSn6S+o5ch
         1TXYb6YwNZO05qlkNdF6MGMEk7rCdAUH9lGfTxiBlWFAcorm7HJXgDlOGhWoXOkdZdJ/
         oIZpYk8gwb3TQLFXyUTXapIWbYKU2ikqVai9Bxi7cGKukQrNpHHWvfjCtTUvsp5pKDSP
         MlMQxQLOnLR06BA/NqE4W1hN42wwDKpRvYkxa/Kx9P4CCe9Tlq69XjmjWjDBNQ/yAKKP
         drOw==
X-Gm-Message-State: APuU4Z/O4HGBBOfglTDFzXjZ4EpP8Wk+EOztr0BreC8I8IbT9fpEltmN
	aCYNohmLPfFvg15/vGPe+YzdY0a304HyHo9TnL2kGZZIRMASw3ijm0mwpSsmW48qRryYu+a0USa
	YqdRatLt0ajaK5lY7l8qTIu70DTumc8tVPQZdKNjRu3KCwhHq6bpMfMLZXdoq
X-Gm-Gg: AYBFou36ULCQSAkPklGZUnalzQEkX26bKe3xu5DXlrGXoPK4kSAIZ8xHkZ+KEpNQ++j
	Spv2ynilwgmtNBDjP22cAnbmpTVnpNwDfMDYQqqV+gl7UGKIlUoaEdN3Er8gHymwpxjy2KWroBx
	8yQ31MxekSsV3mQfkeC2bFwgSziGQeXWzuOcaZK4nwLkmYhCmelv+A7VNfhNf3q+R5cOFBhzv9b
	gktUN5w6jNcu5jTEn9W7wH3jkdvl/aaEDx3KDwHbG8jcHQtGvvfslto+OwA4tu8HSBAOqtrVq34
	Q418al3TFXAqNcJGrJPuhPOWPqB3XBvhVcjZ5ixlOE0D12muiAFGo3vZjLz6rYu1NnwUCrop5WI
	7qpdmSDhloQBJr5wG+HJvXjU+tLiCSOxVtWCfFnYOm4Wu+wW2VgJTf0XrBQ==
X-Received: by 2002:a05:701b:2313:b0:1b3:a8ee:a0e5 with SMTP id
 a92af1059eb24-1b4f5e7503bmr1625514c88.2.1794471701301; Thu, 12 Nov 2026
 00:21:41 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111071434.34547-1-mingyu.he@shopee.com> <sashiko-outbox-210584@kernel.org>
In-Reply-To: <sashiko-outbox-210584@kernel.org>
From: Mingyu He <mingyu.he@shopee.com>
Date: Thu, 12 Nov 2026 16:21:29 +0800
X-Gm-Features: AclHuK-9XbCuqC31cVoVbvoPau3VbO-_VAYR7bfZp7jpsb734tQvirkAOl669SA
Message-ID: <CAAoBcuQxYEPTbR7aMVhGRT5fn72gWbA6Wq_eBWJASxci2zLFrg@mail.gmail.com>
Subject: Re: [PATCH v2] mm/bpf: Always flush memcg stats when explicitly requested
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Documentation/process/submitting-patches.rst requires a real full name in
> the Author header and Signed-off-by trailer rather than a single-word
> nickname or handle.  Based on the email address, should both lines use
> Mingyu He <mingyu.he@shopee.com>?

According to Documentation/process/submitting-patches.rst  line 439,
quote: 'using a known identity (sorry, no anonymous contributions.),'
and commit
'Documentation: simplify and clarify DCO contribution example language',
This is my identity, and it is acceptable.
