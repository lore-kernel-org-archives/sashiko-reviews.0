Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BFC2F4A05
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591871; cv=pass; b=DA1YPa7XDj06zwfPr44F6dhee0JGqsV1wuPi/UaiM+J/GSG5aGwNuYMgm+mSsb/Lw4OLwJi3p+kbZNzeiPTvpdGDbyBHj495xKfP+ZFBdj6c9lCmxDb/KIAna0Fz80B1EMhDhroLtF+Re805cF4m/sED2aPHuo4rDDvCakkp3WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591871; c=relaxed/simple;
	bh=gOPNZqLp7a5HeIP9YLnnqfOKKfCkhssIhljZ/6oUCzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGJYhl63/pwp+EWOh72PeYFm42WR5ojrqhafVM59kFqIqZjpfzm3+2msoG9HHLblyzrhpA0KimBpdGJyfyEbTO0E5pF6nb/CNmKw5iTG7u6mZoWxM4+zC6g+NZrQyrIgdcTfDkRIz891mBvxITffNXCUi9atwNZL7ptcrKjy0nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJk9NMx6; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJk9NMx6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e347638adso386394a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 20:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786591869; cv=none;
        d=google.com; s=arc-20260327;
        b=koE2scVj0Q0+Vjsg40tZF4dg4RBl0HVBPNbk7Lk3c+FISIMtIRsOiimcSxbnPogHhx
         iGUsrWebBojDTS8mcJBOHNmWa2OqesXEAuJVdzAX7J2wqs4qhg0bNexQ3r+wulRhTAe9
         CZqKirC5wm9pO7x2WXfCFl7BKSTyG+tS450olN2CwVkLfqktIEHwkzuzWmFNlkZiMZAk
         VSoHPr00i8nk5b4OvY6aVINrunDHT5RBgOAT93y2VMQr6rB4577+zPNkEBSEOGRgnxdz
         aXk752EilB1/ejgL/AbuAnYCJCBVe/4/uA5qMtxBSr96Ez1AT9XPFulVtuOaA9CXVDA9
         cLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D4T9bYHXVCBlbZGZYFqh4GD8XHK8t3g1v1wjuNVx8ds=;
        fh=EOwbGu6VWTfz/tEdQjXSTD6cZJzzmDOPooRGpDdc1gI=;
        b=UulSN/7+VhCcETzvme+sV4EKGUerxFIG4CxU3fWoquhHKmQFkgmMPFv2yCCkNWCNEs
         nA4rM3cK03kzbwlql91yO9ewTiFUTOy8ank7RJToOk6XZZzTFVun+jkjhsUeeUhebvqg
         yJ+saKBJca7XD99zGSMG+Ylai6QmC9wTN51PXZAOq1PMap8eIKdHhWC8t9Ya+OLv88ij
         hqwgoJnqnsc80mc9SzjSNFqdBghFL8IiEuJQYwS+rFEj5paLtqoQAv4RaO+4tKNJczmj
         hLcyUXOmtQxikNigRznXkO5krJ3ULeZPr1p3QDu/wDcRJEk66mCvH5UxblXJwtmc6ohy
         qveQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786591869; x=1787196669; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4T9bYHXVCBlbZGZYFqh4GD8XHK8t3g1v1wjuNVx8ds=;
        b=SJk9NMx6cjURztCeqOmr3B5a0WrtLpN8sIVBstB1N00atd25YrWWOAyDaJL3nPeezn
         9S4vbYx86KY2mWTubZR6fvMnRKAh25dB4by3c2FHyC2NP3CQoqtqnXjMy15rhhUFa45l
         pFpirxuuD+UtlvZuIShOOhs5sINOu9/GuxLLGcOaiHom8AUnnlPIcKbcOJ3U4tdc9BbW
         PV8s5o4qWkUFrnj8HOBlsAfwR+N3QviaoeJCqn0ZkmzrawxDV7nY0+cKkNySHcJWZVMg
         tLnmapsLN1ZiUE/+XEra9+4o94y89OShPLsA3Hk2S2tmI6gchC2IZ6qPvUMC+32JdF8v
         Uw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591869; x=1787196669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D4T9bYHXVCBlbZGZYFqh4GD8XHK8t3g1v1wjuNVx8ds=;
        b=enVOrm99RGA8CG5/JxtpZ/vstdPFGYISAIkfvzkXTdHB/frHtIDBh/6+4J1Nvr9tYX
         1x1eQ3muLpXn3x7d/d9a0LWBaurU8dG2Jl4/oGdt+LGj23KHl027a4MmWYvuaSZCq7AR
         YiE+ZEZIeFD+K8lGFYIMHObmqX/7xh3jwOsSmKc1LUuetdT7g6qxJvKBIX35NKNdjHdo
         EH2G/BmnGB0ZolRMIr1GswEBhQpyswwtSgoVxY2w35QbvBaM1ZUNWtHsTXMpkCWAdJKi
         SHV37Y0IYfOjmX7uYH5zkdrEZ89vJJEgCDPpmwaEFWVAQDgc29cNdYlMEmle1boA6Q6W
         t7AA==
X-Gm-Message-State: AOJu0Yx60CHgV9doeHt4qBlsxliBsBRCL4k0PusuZbn2v/1bNrln+Osq
	dmG07czbiJIpD8UlKlnz2DBUKI0eznFGqgLWQBAxlzeKZBUfePT2sDSAyYZhtplLPw7iGJRuRLf
	vuusnLVG9Fn26fU7qMlZ5qVtha7kp7v4=
X-Gm-Gg: AR+sD124TQok60/+w7/33QAdptQDgY60kTO75tIYtUP7dXncxdaJWh222EoxzXaLTou
	czCK9oTDqTMoxLOT2UE3Ax1LGh/dt5lArvtWFwq8MHWjWd0GSngxtMb+HwUM5p9PEPtZJ0cTT66
	cuOKsTgf8XqiM2R7xZ5PfTjDj4D3ufKDS772ILVz1t0KfVtmDxiWKf8vQvucjih8/VEfPpnsue0
	eBHbxTfb3wER8jEZk1HByDAZs5+iw5VR2dO3ILnpihB1vBZ6GrOaEx0u882m+IurGy4C9VRsQ7G
	df6uRIJgh+ub/7N+kMiNgD/xqTJlAHgyZGdwXck3WnDiDmnXT7mOowq4VjlMY/c/WfZBTuk+97g
	GEzGaBxPrLlUZoWJR+MYG4AwH8Fo0yH/LbQzdO0Ors7L+3gH+l1BwcBXz
X-Received: by 2002:a17:90b:1f88:b0:38e:bfe:81e9 with SMTP id
 98e67ed59e1d1-3931dfd7b7fmr3944788a91.1.1786591869462; Wed, 12 Aug 2026
 20:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812101418.37966-1-phucduc.bui@gmail.com> <20260812101418.37966-3-phucduc.bui@gmail.com>
 <20260812102938.D4E101F00A3A@smtp.kernel.org> <CAABR9nEzo9pb=mLhZ2nyDuSYr=qDcgBZDzMUqptyvDCG8nLgTg@mail.gmail.com>
 <da9a3b50-bee9-4485-aeaa-5872f09c499d@oss.nxp.com>
In-Reply-To: <da9a3b50-bee9-4485-aeaa-5872f09c499d@oss.nxp.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 10:30:58 +0700
X-Gm-Features: AUfX_mzfmXh4NLJX1MKsYr1jid54mgT2F7xWNIpS5SDfSoyh36cdjOuWu_5UCJU
Message-ID: <CAABR9nFgiNv6cnYa3+ZY3KnjbKpcF-JHpZY8TVcR7H40vOoR=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thank you for your feedback.

>
> Is there a tool that told you to fix these? How did you reached the conclusion that
> this patch is needed.
>

My main goal was to understand what the underlying core code is
actually doing, so I tend
to trace the call chain and read deeper into the implementation when
reviewing these issues.
I use Bootlin Elixir for this, as it is convenient to access anytime
and anywhere,
even from my phone :

https://elixir.bootlin.com/linux/v7.1.8/C/ident/platform_get_irq_optional

I don't use a tool to detect bugs or generate these patches. The
patches are mainly the result of
reading the code, tracing the actual paths, and then finding issues or
improvements along the way.
Also, through discussions with other maintainers during the review
process, I can sometimes
identify additional issues or areas that could be improved.
For example, this discussion led me to another improvement:

https://lore.kernel.org/all/CAABR9nG2vYKhMKeSxFstCRcHb8Z2FzDTBuQ3PY261Lipx7FfJw@mail.gmail.com/

https://lore.kernel.org/all/95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk/#t

> > I checked all error paths in the called functions, and they already
> > report the corresponding errors,
> > either directly or deeper in the call chain.
> > Therefore, removing the additional dev_err() calls does not make these
> > failures silent.
>
> Point here is not really that the error is not propagated up in the call chain
> but more like if you remove the error messages the user wont' really know exactly
> where the failure happened.

I understand your concern.
I think this comes down to perspective on how much value the outer
message adds.
Let me give a concrete example :

----------------------------------------------------------------
       ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
                               dev_name(&pdev->dev), saif);
-       if (ret) {
-               dev_err(&pdev->dev, "failed to request irq\n");
+       if (ret)
                return ret;
-       }
---------------------------------------------------------------

Here, devm_request_irq() internally calls devm_request_result()

https://elixir.bootlin.com/linux/v7.2-rc7/source/kernel/irq/devres.c#L33

 which already uses dev_err_probe():
--------------------------
dev_err_probe(dev, rc, "request_irq(%u) %ps %ps %s\n",
                         irq, handler, thread_fn, devname ? : "");
-------------------------

Since this lower-level message already logs the exact IRQ number,
handler, thread_fn,
devname, and error code, my thought was that the outer dev_err() might
be redundant
without adding extra context.

That said, I recognize this can be a matter of maintainer preference.
If you feel keeping the explicit dev_err() at the driver level is
still clearer for tracing,
I am completely fine dropping this change from the patch series.

Best regards,
Phuc
