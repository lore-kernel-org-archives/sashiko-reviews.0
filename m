Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E73DCD99
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 23:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783379425; cv=pass; b=P1ojXdB7woDV6AzjRqted4IwwfKgVqGRF1KbtqqYD/qBO0FdyCHNsXrcSq9oKFPXa+WLuYPvDUOfmRSSEB1ETChVM7gGRISBwt/byvzHxDnHoysW0oeQFIMzPJjdhF298zW9LfZnSnyZmrc1qm/ze/fxWOsMTVambXE8NbomIVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783379425; c=relaxed/simple;
	bh=lNvgSjfZjJGpuhuqBhYjAFjqSg+H+3SKT0HJ4hRUmZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4H2Yxogoa39inYWJiOvYCG4GZhAj6lrOUkjmDgBzFcr46RpXw5ucbf6Xc2kMk3iDAb6LZ5KUzsTGRTtJq0vL3mf6Fg4mwMF1drNLkeJ9W4BOd7NQJOWzmVI4oOFrgW7gKusv6v+SsbhPHurvzMZnDZr6BedXSWzJFxpPG+yFxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fgoBTLJL; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fgoBTLJL"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c01c79467so44851cf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 16:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783379423; cv=none;
        d=google.com; s=arc-20260327;
        b=Qbzi9xHSiaTdD4iC0fdbbgP7VCEyb/M+xr9cID6mkbBKtzuCpF0Ec1dLh18ZkhGvjT
         uxbQLrf3dLBm9rA9q10DBFblBnoG9rfgaW6goba7xzTJ9M5A4TeyuqY3QCojw867lgFH
         /+ZjJOHsG6ta8findv3X3O4x7g1e+z3AOJIq7NtFce4T0cWhjjhUgqj5zkTxLttPBP82
         dsBKFdWJbOe78+UazfmcLElRxV+W7IdVDcMEuoVo9AASjD6NpbtoHZGQxZQ1ucvFFrc3
         hXgEBKGnzC/mM2Iqwr5RnB1LjWajESjFeoa7yftRg+BtnBWxx27zWL8CbWe/EaxM+Dn/
         LPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNvgSjfZjJGpuhuqBhYjAFjqSg+H+3SKT0HJ4hRUmZI=;
        fh=TYEpv3wrjtuDfMe6DtVmC1upklkbyVjb4BVz5ZJY2b4=;
        b=f0z1HmWxyslgfKPZsU4tv+klbODFZ0uqLC9WjGrD97Bb4yAxHy0n9obQ0su8vgBnea
         DmQT2okg6xR+ZYqJbbH99L2PfpCen3Zi1YEDBpuYcd0XKTdrNXsEbH5cWi0ZL9ovXWHi
         gGNvrEnvDiVtSJcNz7j3wXT7N7podCz/WypjeYr7weIhGa2l1DC6boXgMHpU6nJFcKSC
         BG75lv0h4VPGKfvv93rhoOGUk+HY4q2IzDlTTyL5vXbWsvAdimdt5Tdw9f8IOCAkB9tb
         TH0VUa0fcKctfgindog27cwuesfACJwW51kNhv9wwJGfridANbv0kYEXvrESTCqR144w
         B5Cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783379423; x=1783984223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lNvgSjfZjJGpuhuqBhYjAFjqSg+H+3SKT0HJ4hRUmZI=;
        b=fgoBTLJL9Q441f/SURvowaKM45aChrw6+Rjwe+nKHths41wURZNKAL8unh5dX8/vVN
         Lu74EJW3ohiBRkane2yqnii2hWk6kgVzc/sHj2q7epph1wR6H1dkqULd1s58M/Td9JYd
         agYDHcJDOK02o9h86XORd5+B+3NzMF/OQtYZ2IzPHxTUtLVip9DVRClv2KiPe2No35ts
         GXTTy8wp/a2G3gZWmPjYSyv3kkzwgxcZOxWlBuCL+C2APifzlsSfNNQ/JV82gKg2XH4i
         vU6rUlXIS88siShBxKNtz4+ssRSOtoiTgsK6ckij2Ejw6AtuRr2zyVIuCz8bwYsUjCgs
         Vv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783379423; x=1783984223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNvgSjfZjJGpuhuqBhYjAFjqSg+H+3SKT0HJ4hRUmZI=;
        b=I8ey7M+M7jd1Ul/QCibL/Sy3xmrmoTiiZawVOPVLlzHEsz4N3aRYBIXQBbTo1uUG5E
         yYBr6wOMOcq8wfJbeOAvCL2Wgh0z/tOqOZtmP0R5Ci+JwmVD76m3gj+xEtHJPfHM2a+K
         x6pki297v0WsItqN6qIXW2RS/wA2OjtVr7If86wgVkQbQMpehK2Vd725SKj460+UpYjl
         XRfWrNS+wmgyHuu7W0S1/PlEfn1kxtSu7vqpu52dhp4hYpzdc9xLDPz0TYmiO21KPe17
         pWll7RiEfSfTvYuR5ldO6YeI7tWXOr0aYlVY8ui9Pnlvw96fTSIqtRsJn71q6Tcgl8/p
         XqWw==
X-Gm-Message-State: AOJu0YzzInnO0TcW7OdCX+MN9wNzn6UagoThcNz4SPqXiFDIBG8Toxc0
	NOXmW9SaiGtcxvNdtgtVXsArgTeeiUxi3EegonsT4VPYhsaCTRhTvucilHvcWUexSHnc/UmzzxH
	JNpkxGV+RhvQgu+Vxl4z/twGaQu8eimLdWt8mDPNnZW9uOXB7uF817hAjrYt5tQ==
X-Gm-Gg: AfdE7ckPqrvLlQbI7y+9bEEWCcYFBC6AoOIb3JJfiX1i8xVsp0CcuxuBnunTHm9RuF6
	gS5VCQsR5BOnUJUI9t0K+JyrjOPGb6RBWvfDSaBEjor2e+yMpya6rbGPI0XqQU4i+A8Ux+d61VZ
	mij9Wgw1uh7Def9BlbeXYjw3EF8QNNDX5p9M3oD4Got3FzmUkryfwIq2ei7vo24Icq9Up+JBmB7
	uw9bXboaNzabZ4OhGz+50Kgry+34AjgSUeweSPhWMxZQ6/KziBqZFw04QbTwOrgTRXCwpxtTlpl
	jA7s1zaalvnnazhHLiSbeqBzZRc=
X-Received: by 2002:a05:622a:589:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-51c7b37d17amr402251cf.10.1783379422890; Mon, 06 Jul 2026
 16:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702020142.3399851-1-rkaruna@google.com> <20260702021411.B01331F000E9@smtp.kernel.org>
 <16780c1b-418a-4555-b4bd-d442cedd620e@kernel.org>
In-Reply-To: <16780c1b-418a-4555-b4bd-d442cedd620e@kernel.org>
From: Karuna Ramkumar <rkaruna@google.com>
Date: Mon, 6 Jul 2026 16:10:11 -0700
X-Gm-Features: AVVi8Ce6jMKCO-Hs7jSWQQ3CmCYH6YuDY7YIAtG2vGLEVIqUCNjwm_dOCW27Wyo
Message-ID: <CAD50Xqp_LBvRqhn0q93s3aVxtfFWGhf42jBePKsUonfE6V=WNw@mail.gmail.com>
Subject: Re: [PATCH v2] ata: libata-scsi: limit simulated SCSI command copy to
 response length
To: Damien Le Moal <dlemoal@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, cassel@kernel.org, 
	linux-ide@vger.kernel.org, Igor Pylypiv <ipylypiv@google.com>, 
	TJ Adams <tadamsjr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 7:30=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org> =
wrote:
>
> On 7/2/26 11:14, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [Critical] The defensive bounds check `WARN_ON(len > ATA_SCSI_RBUF_SI=
ZE)` is ineffective because it evaluates after the `actor` callback has alr=
eady performed an out-of-bounds write.
>
> Karuna,
>
> Sashiko has a good point here. Let's work on fixing this with an incremen=
tal patch.
>
>
> --
> Damien Le Moal
> Western Digital Research

Hi Damien,

Thanks for reviewing and applying the fix patch!

I reviewed the actor functions to evaluate how to structure this
incremental patch fix.
Since the actors write to the static buffer `ata_scsi_rbuf` defined in
`libata-scsi.c` via the `rbuf` input pointer, the most robust way to
enforce bounds would be to update the actor callback signature to
accept `size_t rbuf_len` along with the `u8 *rbuf` pointer.

All the simulation actor functions (like `ata_scsiop_inq_std`,
`ata_scsiop_inq_b9`, etc) are declared static inside `libata-scsi.c`
so this change would be entirely self-contained. Each actor could
then perform bounds checks at the point of writing and return 0
(eventually failing with ABORTED_COMMAND) before an overflow
occurs.

However this refactoring will touch ~15 functions starting from the
actor callback, until all the helper functions, and result in a
~100-200 line patch.

Before I start working on this, I would love to hear your feedback on:
1. Whether you think this API update (passing `rbuf_len` down to all
actors and helper functions) is the right approach, or if you prefer
simpler, and more localized checks elsewhere.
2. What would be the best way to test all these simulated command
paths to ensure the fix is verified appropriately?

Thank you,
Karuna
