Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66532D7F8
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 07:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369652; cv=none; b=cIrFEWczXMgFrwMnF4FMdF/U2qOkN1slaaELWqi01haMnrwNSgUAttZcj6uzEIOK8rjQI85D6vICavdM5PI/EethmPo7FEHUHn02m5d3ZN3SKXCD8iej/ZDh4Thtacm9az6A4YOuOlIBAVAL6cDlLzSwwJfOKGCuR35MCHFvAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369652; c=relaxed/simple;
	bh=PyTez5HQe0/zwTIa93jTn8ltLOCQgueRSktm6uyM66o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l3aCrhvfh8JfGtrg/JzixeCtYsx+9e7Pb93+RmsREBO0dpTor9iPvdnJFDURKeUSulRzVxZvYDiWdym3fhUbErzbzMKcnLfnZWcrf7Ee6EuuphhfNZk+Q132f1TkqerToBnSjay/r7aiLDho0K9vimYJWkXCzxsJuScyM8xDL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZYWzcWw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZYWzcWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789369650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z11npAfyXyZLp3jcVQ/pUy+RYhbspHGhoXmnEqcpbHY=;
	b=CZYWzcWwd371ZwAyx1QjB0YHlrBXs5w7tH1PQhFDheZhdhN7dddZki6Hza8sTwFQwGSwnT
	pTWExOoTOVk3JpXh7OTu9JMU/aASyoz0V5io7MP9qXgRNyfRoHlKDZuhNuW8J5whLhBsP/
	C8FrE2J2rGMQ8F8akpH+qP9V2ZfBQzo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-MZBKHmgfPBmHWytEeL9q-A-1; Mon, 14 Sep 2026 03:07:28 -0400
X-MC-Unique: MZBKHmgfPBmHWytEeL9q-A-1
X-Mimecast-MFC-AGG-ID: MZBKHmgfPBmHWytEeL9q-A_1789369648
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48700cc7243so275361f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 00:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369647; x=1789974447;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3T8MmJHP0lKCHrHGSLSWbPMgzGHktYBz/oTT4ophsQ=;
        b=HKjopIvHPWjwH2HPHSmFiYC5k4mIrEfpBESAfZssHgH2N9zzzDBoIVXstWz/0yFNGz
         Hjg2/E79l22Ho3KyKw0v8VwSyjy1Bl9cHD0W4GfOzqt/Ix9AVtfeQIvj3WyBTIi2Cjq/
         7josuJrkzXIatNEKjJXZQ8949J4qML/IoR4tuUMAj9v58J2QTTMCqjzq3K1DHFYm+VvF
         0/5hKbPfY3DJ0b0QySOsBgcZvnemdGAD1XMxNrI5mwZoxHDwBwdZn5ssG0Xn9wBdnXuI
         bRdZfKuDqMcNkzu5M6mzHLbwiAtv2zZ3EcRFcnc+o7Rib1EEVbQJK0hTYvfK3KQUS+Yh
         Nvzw==
X-Gm-Message-State: AFuF++kS0whoWCMyolkdc6cFos/zO1QK/PONDZtL/9WpRs860icZFHrj
	sQDHpaC+QNU38FFPMPWNrzIm9rk0Ck0FmJY4utRzvRt1qQdIWU5r028wgV4dzhEFP7QLuo+3yr4
	R8XCeudyICv+o42aEJfI42FXYGNha7cB8EsSa/OpSyBm+8Hjklkh0iwv1GVs60r6WR7fg+g==
X-Gm-Gg: AYBFou2TihYWvvWuxmQjXC6rx3ZJFhuG3hRdS0NE0u26By1gYAmbm3rHaR37FNwVAuV
	QYGk6eSmW5bWyUd+Rjnw8wd64LqENtn6Uj0L7nwd6TGjmnd84W7I91rRe3K0FY0/xHyvHmySPHo
	WpmpF0KljsMfG9+HEu3UKgZdGymx8j+oo2MEfRgUfRHkeVngT29Xjpgd5Nk+6OJTatCpXoN+5Rl
	xki5c3wT6tcgD/gTG35FNcOyhGInpc8p0unoR4OwHy9dPmDpNmYXYat+HaovggFkkrPpMrJfWaM
	ZGbTFV8HigTDKDuI/u638gw3gxGlBEHAr1PY6l6vgbmoKcmLJ6dLN0YerNFzrOLD2kXIn7DlQ7Y
	C45vUl5+Xh7DjkbhGvDNoQ850Hin2kdozf4K/MaBfgvEylk7ifcrBVd0Ntg==
X-Received: by 2002:a05:6000:386:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-48702acc272mr1050455f8f.16.1789369647577;
        Mon, 14 Sep 2026 00:07:27 -0700 (PDT)
X-Received: by 2002:a05:6000:386:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-48702acc272mr1050421f8f.16.1789369647201;
        Mon, 14 Sep 2026 00:07:27 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm25154298f8f.19.2026.09.14.00.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:07:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org,
 conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <CAOEgbEqd6pGUL6o2CbyePUWm=NBy1GJJaOm+_7rg3CsEGqEfYw@mail.gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
 <20260823112814.896AE1F000E9@smtp.kernel.org>
 <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
 <CAOEgbEqd6pGUL6o2CbyePUWm=NBy1GJJaOm+_7rg3CsEGqEfYw@mail.gmail.com>
Date: Mon, 14 Sep 2026 09:07:25 +0200
Message-ID: <87v7881fbm.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CdMFMdmpzpBkPUcuYA4Q1zXdAOlHzxm1O_eqybCBnHg_1789369648
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> On Thu, Sep 10, 2026 at 2:16=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> sashiko-bot@kernel.org writes:
>>
>> >> +allOf:
>> >> +  - $ref: solomon,ssd-common.yaml#
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    enum:
>> >> +      - solomon,ssd1351
>> >
>> > [Severity: Low]
>> > Should this properties block also declare default values for solomon,w=
idth
>> > and solomon,height?
>> >
>> > Other bindings that include solomon,ssd-common.yaml, such as
>> > solomon,ssd133x.yaml, establish default geometry values for their spec=
ific
>> > compatible strings in this block. Without these default values, device=
 trees
>> > that omit the width and height properties will lack a schema-defined d=
efault
>> > geometry.
>> >
>> > --
>> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959=
.17029-1-amit.barzilai22@gmail.com?part=3D1
>> >
>>
>> I think Sashiko is correct here. Let's include the default values in the
>> DT binding schema to be consistent to what is done in the other bindings=
.
>
> I included them in v1, Krzysztof mentioned that they should be removed
> since they are deducible from the compatible:
> https://lore.kernel.org/dri-devel/20260611-psychedelic-funky-foxhound-a8e=
39d@quoll/
>
> I personally agree with Krzysztof, but I won't die on this hill.
> Let me know which way you'd like this to go.
>

I see. I don't have a strong opinion either so I'm OK with not having it
in the binding doc then.

> --=20
> Thanks,
> Amit
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

