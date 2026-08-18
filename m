Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE3348C5C
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787081166; cv=pass; b=t+s68sTK0MD9OpkSDYmgDz3XkyQnRRrkZ3twawz9cL+RqzA+PsTMW0zo+x9HHpPsNoykMcfqgfWTnIUQCblyhCq7GnT+SMWQkr50ZTiv3S3/iVevOob9MF1g1jJP1oNSuhYXi2iKlzsznZ5vNCM+UoR41eADJqXV90s9RCJGxG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787081166; c=relaxed/simple;
	bh=xD+DTq3vAUF/JATmwOhJZ4DPUbk6IOr1mBsW453i8Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RC1ZL/qqWvOvb8quFJHw2kgBh0PURyp5IN7rjFHLD/RvknCmxFjX3Spp2adIROXVSanAM0LG2kugEbsSCHo605jJjyY2nZsQsbFAvDeJJ1zPFNrMkj/cx92mjSeC5dhSgwylL3jLlS7mQGjcd+0UPEaQgCc9jeVNtqQTptvXmqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPD9l22R; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPD9l22R"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fde295992so88824f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 12:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787081163; cv=none;
        d=google.com; s=arc-20260327;
        b=B+h5bFvnKatKEElq3HmDBiw/xF+wpUvGeaXktw5rZp74HH6OnWGXpUNNDu/GDcwzKU
         /YFzTFQvVjVjqbfqgtMSbhGu1EOI3CJuvg3KkA151k2x2sYWPi4X5klvRBgUEJEhROse
         rgbQ3C1pC7vgiEZFBc+VJ87tlFQSX69SVILDvn9cJiisFpIse67C4mza0syr6PV1n5fY
         tlRRh7C5hBrxSgZpUKaKI44TTm5x7kspPWnLD1vr1BiF69o/2cLidnrXDOkPXWNUgJdk
         ZUS7Hjt1rS0d2/knq8tNkQH4fZwyCOMerRNZXpJtMZBJEBL74oyHpXrITt6L75EgGuzu
         Dc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=si7KMVjebKUIdClbZKZkuqtNOVYTxZqvVqmzIewFdCU=;
        fh=P8nrG7R9qfJfo/Mf+fOQvdAW9CiElD5XrO0qauOEdz0=;
        b=naKz8u/7CRGtlF5FcqmCHsqV1eXcTZsogriEBYp8+w4Nd6CiohJDM5jWLODWCnrP1R
         HUkI6cVKlNgeBFg9f2xgggMW/isGPf7qLlIM5CDfPYoPRaRlnyRBMCLgLEmqnCHg3wWT
         shKbs9Z4FvOoJNFiC6FXeuTQqjXOIZFaexHD7CWw5vvcuYcp39D/Sgj18KU5tASVOGhL
         p1LdlXACaCHqstWtc1yBYudDogVRJ/8sZmIMFuEWwFFrk1gw6bXlCu6x/vW0vII7tuz4
         7NpIIKM8Jg3IkJDvlsA7GOjc7389g9GvO7bft/a/S2cAhlfKKMRERTDJyctOXep/ovAE
         DGIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787081163; x=1787685963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=si7KMVjebKUIdClbZKZkuqtNOVYTxZqvVqmzIewFdCU=;
        b=bPD9l22RovqS/SdTIGsYKu2EwvwGJJ976f2gFIBp2HSH9XTPKsX6r7rpRXfmlMgIpT
         nICSCmy61BAjWFbwWSK9pN0tlGn2LLGLjzvQGQNzaqZ3535D9MdGEq7w2WKSzwsh1rJT
         1XlLYcZXTy4j4YRCCvmYOd9uZDxn1QE3I02mlacy3DjUh8P2uHx+YKtEK1U9oyNVRVkm
         udXhFtt/OwL9TKUpPMwcCEZdu5ogysylxHZ11ceUamjzyIeHCBybeh5CnFnUtTrlSU/y
         1lorwGl0J9Q44aWDSEK13yXUgr46tjYoKJdS1VBAg/Tg+mE2aL5KWL3ycpsGhtGOOwUx
         ljVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787081163; x=1787685963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=si7KMVjebKUIdClbZKZkuqtNOVYTxZqvVqmzIewFdCU=;
        b=J4VEUEXS7Nf8caP+tgleXwBVxilV5FiahoqFc1HSPfcL1ksIL88QLjgMLSvi5JsDg4
         unb9ryC5ou5ei9MEUlxPoEf6nw7mBnEJtOaR2/W9pBXj4MATprVsyq832h6g1+LOu29n
         fGHKfoo4pvFLlof261PXodk/okGtNZrqQdA/bt6h3qsPESACC/51fwnk5lbDSuGO1dDf
         ofO/IqRsPD1Oq7gc7EPoug8ijfOfk2GL7yBoEW9MwQ5MkNBlxClvox89seBHVd8SmihL
         bA+NMINdCP4eokbvrIwdXS8RY5Oz8G0V8Z6MPy2v339OqiE5osUQiKif0VZxPlcp85iC
         ajag==
X-Gm-Message-State: AOJu0Yza5550ILSopJH9g6Gdjh7x+Wk7zJTMyLwOzjmMEmdu8kDbFVEQ
	m1x4+o+WrDejsuc+lxFTwJjj4DdmMu1oYbad87a7hbjG9hn1MZgEG+4C6jHwQ8mRNXeN8dh5F8s
	L/CAGlEAjwsyWFVClbW5Pb4+sVF5lKFw=
X-Gm-Gg: AR+sD13i1HUPrPxAOib3vDEroL4JtGV/J2mZ8UrH63LsqjjW4Ssq3y7TUE7MNZXL+Pr
	hdN2yr7z+QPgB9MlrbqzzHCQ73Lxed/uaa3WI16wHChA4WjzrVfH3WPF3QhJzIZ6E4uaT1yNm+u
	R5B/aNYGLI28OWaHhOuCLKnnlo+rsUBN/6s01oPhY+m17ijGNW4b2jxmGVFj1Icp60u5/RpzmTj
	dDP7eryubJc1JU2RUjMKyhPWR+iAEK5uFWwgdVCTCQe4pPpN9MfvvYGi9++zvVV5A24qgNg2Jnq
	X3JKz+rh9SIRaI0iOgqgkywCt1xX1rmnFiUiEMRQX9CekY0m+Qa0GijE6TBuMlLWdhoW6PEkVg8
	UeKkbO0kA0CBeevWvU9ZTIfIQjLtvEN6AjnelAmFnASwjDOc2NRO8dAfqPR4toaY=
X-Received: by 2002:adf:e50c:0:b0:482:a9a4:91e7 with SMTP id
 ffacd0b85a97d-482a9ede2f3mr11527757f8f.15.1787081163046; Tue, 18 Aug 2026
 12:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706180331.3AD811F000E9@smtp.kernel.org> <aoRB8CrV7ECOG33Y@ninjato>
In-Reply-To: <aoRB8CrV7ECOG33Y@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 20:25:34 +0100
X-Gm-Features: AcwNN1XvqpNfeUIyYJ22liaTzQ5Arj1acbogU-h1r2Q7CoLl1dfoF0q-qvhOhnA
Message-ID: <CA+V-a8tJAStSKfsESoEE8vUjgnR+P1yKeYKTnpN43+=MtgbCBw@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, linux-rtc@vger.kernel.org, 
	robh@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Tue, Aug 18, 2026 at 12:28=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Should we add match data to this compatible string to identify the vari=
ant
> > and explicitly reject probe with -EOPNOTSUPP if the clock configuration
> > would require the unsupported SUBU mode?
>
> Correct. Matches also my notes which say that this code
>
> 445                 if (rate !=3D 32768)
> 446                         scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
>
> is wrong when we have a variant which has no SUBU support. Because in
> that case, we need to enable SCMP even for 32768Hz.
>
> So, yes, it is needed to mark which variant has SUBU (RZ/N1 only, likely
> forever) and bail out if no SUBU and no 'xtal'. The above code needs to
> check SUBU support, too.
>
Ok I will introduce OF data to handle this.

struct rzn1_rtc_data {
        bool has_subu;
};

Cheers,
Prabhakar
