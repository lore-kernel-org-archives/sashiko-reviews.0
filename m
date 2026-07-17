Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7977D3D333B
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271551; cv=pass; b=TEmokz/gHLhSm3g5p8duji5KdxsVXAtcZvro/pdkQ6pS/KEB72gEEh8tpgzGqc60VVyhIRSM0cYLi74Rh2eG9vG3a6kEA7HSkfDnnDdK2HD1YL71NKfyKs0smWF/4JnD23QUvXge3ZDwakdipD0zyaf3y3Bt0sq3V98cAIzvrfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271551; c=relaxed/simple;
	bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJGMm8w+SuY2DA8ixajBNhOtwF/M4mKkkW1Fzn48+qgPO+lHSjIHAQdPq56NfcT1K/vkODQfobYSwe1oL2i+JskTk8RwbZPpy8aYytOI7S/dULeUavubVvIMmZn4yX7649lRVgYmLybo4fpeIEWKJ3UhS2wEafdK/eQdT312YBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UD2vYv8A; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UD2vYv8A"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c04bf4711so71770341cf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 23:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271549; cv=none;
        d=google.com; s=arc-20260327;
        b=HV5fb0e8UEyHrPsZswvA8rL50qPspbrmb7ugp00EpdoBEob0u87tD7Hnw5cZtwf04e
         Spf/nkhYFsGSUOWOkFSUUm+LtiMwAf3VNzcIPzBUii8TDLHqbkL9QrF3FOLN11A6XK4z
         lF0aTChBoiefFxvUbReCe+9+hPzDV0gAcStBZXP02PIGGC8brkuFeF8HykHL2S1A5Cwb
         r9lxQXzkbIgfiEo0DaXImYBIR/2A5lDy6HhLKpfAV8XULEPN3sdFzKO9nHqb3yJQm/jv
         dL25e8QKcZimGqW+uzocdBayXOCHNhAjaBq+2FnzrgVRYeM16xtV+CjbO0qkEXiVJYwD
         6enQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        fh=lUMQWPkEZ6AcKIyZSvVSOYy9u0mvoyhr4Ztb1hNfA7U=;
        b=cnBJEq3iZjzT56NFwve8zOyn+HAeN/tPLoHExHEX5/SJvYyZNOIZTZLKqCY7Msdz0o
         sDi42Ag83npXHxDRn9cPPcsL3pnkFQcax5H4yvTIMex/TDKT90dPt01rZyHenXmqfxU3
         Pl6MvNeaBUAa2fu/W/qZFLyFYX1rlMV/3aeptCYMMHlJz9EoZaY8ypUdiRivuNh8xkjW
         mtYhHGKUZ+QOcdLjpeXn9WwaF2+ZoB/NOxp2iXv2xwgJI0eilCvhV/JM97kN1AT2FUO7
         u4z3YX+PiamtMe8ArauuZ7veNF1J206j66t0KeBv0/PC8ebP8G6VnpTIJaLOiy29Ctur
         pTGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271549; x=1784876349; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        b=UD2vYv8AOvK+Ot+kpqMFk52d+emgsHfxZ2J+H+/UyPy8VqjREwXpTSqVtZX3TAZvJ+
         k9cE5XdYRJsryYbDauM68uDR9SR1YdtGBigDbfI0PsPvUguYLeBf4XWWlIQHvgB/2/PT
         2Hecfoox+hGZQ9qUWRxNLuMCk54yMJqPd2lr6eOXuOc1scNCfQMQhTTy/wtz4cTEoG/S
         QBWrBVkRq3vWU4cH5tDXTGu9glniKvLQXAMWElIzhFaKm4uYmDUlx8xKnfRy9/374z/T
         9YN++qcJ7k/HKWFmkhe6bTGNrcz4XMsfC5TOTbel51t9FJWhiw5Gbg0LdOKUCEHg37UN
         Hvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271549; x=1784876349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRhaAiyoY63/EjHSGFr1tgoiXiEMzGg3wcIFnjjeKug=;
        b=fhIU/0+4JUiMyJ9wH+7NgRQnx/zj/cCfFql/EBJQ3axBHZJnelJzqVIb+VakqQOX8V
         pFmlC2BYFcZC3Nusy8brfLhjA3Ooo9FyM6Mab68OpAq392qwr+5uH6EEW9W605SG9PKG
         /mVGsz1Vh5WX1npgEa26YeMjBHvuTi+KxPCppBBnZihjiRhWnCtWMGtBVYK4VG31opU8
         bDXXjv2YtC1bPed3GZ4G8cVVhnt2cyFZnd+Ts+R7tPH89CUF5MtwLbLIaIkB8MakNGEA
         3zPE9xI/kuRUnSc4ZFg8ZGO0rTRWAoslDmfvIz3T1610G+oWNjIZitoUkqTES/kE1sGt
         JOhg==
X-Gm-Message-State: AOJu0YwocAieE0q3LUzEU6VEjuFgcU92vMikV/2XvonXajHdKwXkAIke
	dmwnQ8J9hhUrHrq0XfHQA0ZTmKeuPjFjUUt1SqDjtRusLzVvSd3l7wxHn84GblZhhuFJQkMac/p
	poNmi8jetVkQzAm4cMp0uwpj0hIuC3eBjBA==
X-Gm-Gg: AfdE7cnyycpmqtr0Y+Zcbdor7zeKqRbQEM1wwIzZ5ZArzSHIbOgKFuiaLZtD89jcl54
	bPjH6mzBu0e60L+WEIgTn1xzU7C6dGwMjDHY+MznWNRmszHLcfkfpXb1yhq4KQvdXPddkJz1C3p
	IqIqVQVsSSrC74BwqWfgRyAkXmU6ayxYc34f1EOiRsK1iPGXU5JC0mEzf6cL0vk3nIVjjeBabRw
	FCPhnDm+yLxFEtWVUy87lIaCX032o6L8k5IsczcUiD1PWBsrsGlCUy7HUhlj08n
X-Received: by 2002:a05:622a:181f:b0:51a:8c86:bd3c with SMTP id
 d75a77b69052e-5213c9d9a01mr11762361cf.57.1784271549319; Thu, 16 Jul 2026
 23:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-4-akkun11.open@gmail.com> <20260716172730.089081F000E9@smtp.kernel.org>
In-Reply-To: <20260716172730.089081F000E9@smtp.kernel.org>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 15:58:57 +0900
X-Gm-Features: AUfX_mw-f0NpYAct72rPmUcEbtzcmaBSPm7yFj-EtAmmmokjNJ0yQdRy__B__oo
Message-ID: <CAKr_iV6PsWZ8MPsO2NdfS1ppy6pUCGjvn4MFF8UMz7updckW_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add MT6589 PWARP and MT6320
 PMIC support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 2:27=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> [Severity: Medium]
> Does using PWRAP_DEW_DIO_EN here instead of PWRAP_SLV_CAP_DUALIO accident=
ally
> disable Dual I/O mode?
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716171733.30=
0885-1-akkun11.open@gmail.com?part=3D3

100% correct review, I'll fix in v2.
