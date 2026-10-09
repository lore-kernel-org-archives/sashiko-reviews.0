Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73422157B
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791585983; cv=pass; b=a8EwyYWAaXnBY7iztZ0hDOoU6GzNLKaxaFhNtjYsAx3tD2PBTSuX0rBBQ0nbJlUQR5iYiOx3imIVQ/TL6PhP17PhHGCIHCX2HI1okBnu/qgz4JGoXeuyo4L14q1gmKAlTm2HX/hl1fZ5uScA1xF5/OaSi51uDiPTU2ru0UW08XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791585983; c=relaxed/simple;
	bh=4KLRhiuXd6vs87HrQdRYKVSaRN0S916uaxbSgL9ZNic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWpV661jQEp6Vd7LWrlkHtUeymExVSSFy/9m6E/z9NfR9jGQtcgPDRoJLx2sA3tCcXPynCLguQMR0wYH2oTBgDtb0ds/VRi7fWm6hbyzpaCTGDz+O/OAjDdu1st6cxeoVml/CrAVwGRBcq71iy/u5Q9MnYUOJHqOWZzFtKejdmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnF+dfWR; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnF+dfWR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8198a3a54d7so2160674a34.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 15:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791585981; cv=none;
        d=google.com; s=arc-20260327;
        b=ekVbCy3WFXHUT/X2kAsZcRalYBZHQIglMnbtogtThkKKwQsA7o1va50GLMFdEEfGYd
         6v+q3vQXVrQE35lQkSbgjwqNPjKDXMT0AXaeSiv1MlWWj2KoTE0F6ZkTNfozv0U/h0ds
         suC91q6QRHWd3U13Rx7Jc33gjHOeXHGXJSZBdWsESYdr2OWkZprBWCqS0auPrU8Fv5yT
         Q1trTEBfNXiRxkTENFCiuBpf/UrDkWOPZ37g+QaOcwbELVW9LsqFa8dil/+z0WqHKAgT
         xL00bZ6Tb2e+p4khRM+FqfX8xvyf5aHhPpKFKYhGQFWBT8xOW5eltGnjHaOj5EI0e1wE
         ULow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ehjg9tbNZBPJeJol3tfp+R4B/4a7dVHLZ3bjJzX334=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=U/mFEa3MDKTw0B184zfwqMdu8kWjlrHl8QQY3kt66XjxKZbhmoQRfUKt6IwB9YGFsW
         NQ8AP25Y9eOnkUtaPOYzpyjlo5L+dNJyl7lwmiQB22KqyfAiNNqPDT9yp2TX9q7BloCI
         A5xweJOj6DIO1rRjh7aDC68D+7XYYAGOz93VR5X+CJhaNh1PbEItXVVE9cH/4gr+OgFI
         3AIDM4DiamK8a1X8vFsId2hpRL+t1pmHcm+OstYURj66tpimBjucrSWafI3YI5hTkcPq
         6QJPncbGLq9v0Zj7YtvSRjr519gkp3u+SdpdDXSm8SEdfCVw6sT+eCEEbC8PkEibctxz
         3ZWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791585981; x=1792190781; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ehjg9tbNZBPJeJol3tfp+R4B/4a7dVHLZ3bjJzX334=;
        b=nnF+dfWRQlZA6y7epeR+iITeoL64F+FbWqHF+NzNIPgdR3iyrdPrT084m+tYjbwdod
         Bvc6yriDsuwci2FRPWUJiZl24jmWnVxjaktVjub0y8egiKnQfgZAFlLnikgfA/IJpCzJ
         DUimRc1tMEskNcOp+mMRTKkLz5nrtkGlK8S36WQ/fsj6X3FDw4qaZGdXTo74AsLzU4Iq
         nBYfJHa+4+m5X0gz8czE62uSsAxjz4FLHj7W1gvBCI7Ba4Y29iCeVkqwx5QmhqBekqzn
         5k46OkuouK3u+GDMcafIpZF2o6zGBiNTedAIFw1/57E0GWPifWAG89Z70inTdk14ujUm
         IZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791585981; x=1792190781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ehjg9tbNZBPJeJol3tfp+R4B/4a7dVHLZ3bjJzX334=;
        b=ary8jqCypQ3vWnVZ7gn3s8DrqN/iEZVe2jv0dwMdQzXFRoXFwKg9Viv2vfyNA6cp+P
         oVV+sBNmkXlqAtSUpXItl1TCEGK8moEbZuglSrxlw04kbrp6mY19Tq/lwPO0Hj8W3WKQ
         Wb5tYaSGfqAqRQarzs8Ldxj4VXIWEbgSw8xHMf6PpTdDju2daVPn4VVy3dVvcWlm7zgF
         BwwMniCCXny8q/cfhUxzbQVPQM9Ze5up8a8tpRtFfPdtWvcMt7M5Fbj9j3zIta5/LqTa
         I59z5rmE6RuGxFqZgYFwWBJOAD0f6CUQA5yvvpDg1WL1dfqemDvEE/by3vmKUlUjDkqv
         VImQ==
X-Gm-Message-State: AFuF++nPu3bBfMiKWOpnkIzVbdlbaLPb1LuCYIV+IX54fawwYHSVjxp0
	Fyr3skRFIh0tuQVmVmwPiKZ4tlQjRtIzuM16A2y4PEe2um6gfIRODpRKjNzhgRH3S6o0OIAiyoa
	/oF6OSIPFjFJzyzMH4aDiEc35CRrGdYNRpmNYesQ=
X-Gm-Gg: AYBFou3mGLb3UGJzzu87Q5CCJEcYAjScyKz6PIiQ735INkT8NjnhAwVpBX9aBN0ttg9
	MtUiBhoRs9rj8SRsmOkd4wbgQX1/9ksazeLT7UXsjOr84m9LwnAhIV+3MsFjKVD3ddmrSGEHRlH
	fpLwPu1Nb5Zu/nE0keUxC5Nf1Mf5ZHcP5RCt6yOXkYrJnQClcm5EXowy5yYGwZr77oyt3NSyWy8
	aQVmGbXU2aZFT/vBNfKfSqA5gaF/eWQY0AWZ0ZZzXbSxQFxOqtKEvi6HmVXjq7kTGG/fqQgSylA
	i/DP6tt7Mz03akKH70EuwassC0R7mfd0sziKu1kK9YYMGnvkx5EqfR0LvtbpNCRc1n3/nF23pBl
	vVFLQqoHJ4tIkAA==
X-Received: by 2002:a05:6808:238f:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-50b5c9bb14emr2445879b6e.12.1791585981270; Fri, 09 Oct 2026
 15:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009214404.722628-1-mmyangfl@gmail.com> <20261009214404.722628-2-mmyangfl@gmail.com>
 <sashiko-outbox-166096@kernel.org>
In-Reply-To: <sashiko-outbox-166096@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Sat, 10 Oct 2026 06:45:44 +0800
X-Gm-Features: AclHuK9BjguRECGBQxK9DXsJst-8IVoz5PwlgnNbwjYRPBtx-f5QOL3eB7nDJO4
Message-ID: <CAAXyoMMwUqwgyPXyG=zKqn1hkWeg769bPrwwWF=fNo0G7dzoNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 5:52=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Will this strict constraint reject device trees for the other supported S=
oCs?
>
> The description explicitly mentions support for multiple HiSilicon STB So=
Cs
> (Hi3798cv200/mv100/mv200) which have different voltage reference designs.
> However, restricting the compatible property to a single exact value
> (hisilicon,hi3798cv200-regulator) rejects device trees that use SoC-speci=
fic
> compatible strings (e.g., hisilicon,hi3798mv200-regulator) or fallback li=
sts.
>
> This prevents the proper representation of the other supported hardware v=
ariants
> without failing schema validation (dt_binding_check).

No intend to introduce more compatibles; follows
hisilicon,hi3798cv200-pcie conventions.

> [Severity: High]
> Does the lack of hardware calibration properties here cause overvoltage
> in the driver?
>
> By not including properties to describe the physical hardware bounds (e.g=
.,
> duty-cycle mappings or pwm-regulator integration), strict validation prev=
ents
> defining these board-specific calibration values in the device tree.
>
> As a result, the follow-up commit "regulator: histb: add voltage regulato=
r
> driver" relies on the standard OS policy constraints (regulator-min-micro=
volt
> and regulator-max-microvolt) as physical 100% and 0% duty cycle calibrati=
on
> boundaries:
>
> drivers/regulator/histb-regulator.c:histb_regulator_probe() {
>     ...
>         priv->min_uV =3D init_data->constraints.min_uV;
>         priv->max_uV =3D init_data->constraints.max_uV;
>     ...
> }
>
> If a device tree author specifies a tighter policy constraint to protect
> hardware (e.g., a maximum of 1.0V when the physical maximum is 1.15V),
> a legitimate request for 1.0V outputs a 0% duty cycle:
>
> drivers/regulator/histb-regulator.c:histb_regulator_set_voltage() {
>     ...
>         if (min_uV >=3D priv->max_uV)
>                 duty =3D 0;
>     ...
> }
>
> This configures the hardware to physically deliver the unconstrained maxi=
mum
> of 1.15V, completely bypassing the intended safety bounds and potentially
> damaging connected components.

pwm-regulator.yaml: This mode uses the regulator's maximum and minimum
supplied voltages specified in the regulator-{min,max}-microvolt
properties to calculate appropriate duty-cycle values.
