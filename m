Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254C1624DF
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 05:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785129037; cv=pass; b=laCu3/XsLx06hzvQSQmsZVx3TSTz6m1LSFAzJdkkt1VHaPZF5gqv1keZNWuvyD3nU4I4YZiPYnaCVCJ3Bkysk/JNNRY1yMDso9aPRSRYezwE1Q9xXLVZ/qhY0I/3N4QM7CveX9IycRtblIw2hri6HFBMLXIIT1E2/y1JSviLKb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785129037; c=relaxed/simple;
	bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvtB+ND3keY58yML6FkCtq7hLXeziiSamhdtPKGXa0hdU6XRqp+5oMQdZOVwhS8vl21VeF7RdJIeNp1r/RCmaNW0sr3pbzdWcFdRN1ZicpXWhfD2Si474pH9xUfIJGK0bG9liiWoSr71pmed02YnMkW0oYQRHyW4KCgi1Vuk6Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZURFBXUA; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZURFBXUA"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso337442766b.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 22:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785129034; cv=none;
        d=google.com; s=arc-20260327;
        b=Gvpd5xfY/XP4+0/V5ivVNSPY8tgUFeo+HtcPK8WVYuYxK9ecccZElpYsUeJ3wwauFd
         KFNt25Q8nfXDZENTnI1gubzFx/gVmFR3CtwSSsN9sKN6cMR8U3xaYToCHDRtUwG2fJGI
         GK0DxH005q1WTDj5pxWfiU/KVrS6d6oD6avG48XOhhpoMtrGhKhTTR61USjQ0sZgHDly
         fcETHZglmQbbQgkf7p/SNt79Qd16MDIPa0D75UhvoV27p57Dsy2JA60kEB5DFDyJcHrQ
         nisuRszfooWNH3SvKz/68kjuTAJ0JKJuf6RHMEuHezks0Y5S3M4MJHvps7/g9vTYs0uP
         YNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=Nmb4nHQnIFwjVf08INTNNp8VmRYte4K6UDIfg3KdXwQexSlNXnY+q9nY2lJMdKTvQV
         AQCK7JkDskrnCEbwpsKNmj5vvJgxmkFBtxWHX8VwSeJIZFwyuNNS1EyU6l0EMmVcNCvA
         v1GHCs5jIsRnNpf49+lgDVyd8wLv/XSKjsbmv1jkXNxSnSVHRN25fdPKCB1NC6f9faJl
         v1tphHb9bJfRd5rWvPDKkyd1F5SPuh7RUTR5EKv0yLGe2qOsWqQ0Sz6pmhvvBMuj7KfM
         ggKG+/41SjDrpMg4i+xesvCf9K7BUBrdaBZk+QThuiIzvEt70cjTKmZFUczU1Xt47fFp
         RXxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785129034; x=1785733834; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
        b=ZURFBXUA/kKuNdKK23LbXqd/29rwUSN+Hk2EPYMXAn3i3dawo9y1BooBewjCrBZRw0
         UxxZyFsSbNWpwbPdR4/RFRLd58hAuUBFmnYIme7nc1xNnknfvjz4uDt7CEfzxc2QxXj/
         KkfY6GGGQPGuqqpdFIviF7YC2MjXKc4y9Tc57oP/yXl/RU44DLL7W3svLVkoSyqu4m6S
         Eo70bU8RuIlfhxlwwA9foCBer8Vz9o6kBirMWz5SoxBR/TapzxqehpcEmwxEQ7I/JqBc
         7mZBX7UfIZqcj1+GBP4G0kCsYCaaEWIXJ42mhrsWFgWX2+Y3N9tyvot05nthd38rpGwF
         f3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129034; x=1785733834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
        b=W4QfvJtaQss8woemDAXwEgiMP/rz9mGOqWyIZBXUkYMKeQxIpLg+KUtosQAefuUBP/
         +CUIC0RcBUY+0Zw/9y5vAXjpjVG9qM6Cge590fTeXH4tAnzpMWGGTtsGLj74Hd345DLt
         xvDTkKg2cD9jiDVBh/vsGNEzJ0gKPA2DBLfjgSCPeglwf7410ssim0IgBEAl3St3HvGP
         ImcJMGPpcu1I1bdEDKmTkX4jwmlljkcnYTpS1jeOT+9gEqvnNP8S+yct0YUUo5hp4tox
         9wcO3FDDSks4IkroroyAqT4LdyQJBXewQpleP4NM2UjtitXkUisYGxeuHYBC79IIopCS
         IYeQ==
X-Gm-Message-State: AOJu0YzJyEc13m6rIpmtxseEXv1Gi0H4cg495LQ4a7wpHqXk8PpM+3wI
	DB2L14rXj8ShT+ZOeXvPDDvRzgHxInvwZIZIY4LVwOaIQmTL02CaeBWq0WQyMBEavt8u4sjDXWn
	M7yTyWf2C+pLjlYLjzwKv9j3ZjemRh7XqPz/y
X-Gm-Gg: AR+sD126HIL5yKbX6NCnw17s8muIshH5Qj26b/Q3CG3hsvwAtm5JbBHhiXSgBWAWnYw
	g2sU2e3/fkFckU1VqnE3eAMaTHb1KNASU8HMYsfESjucmMnSRoufulkM0bz+KAKatlLaMfCvROT
	WYltGnUPgKd4Bu8uCG7kY/Zq6tnyDhP71bOUA2RzWTau9OJ2AsOFFRlH2Qg6rfBExpvFRfK1Dp8
	ZymDfyu0YPqNsbqM6gKqJCC8g4F5d8+oFcIHDRo7GDNJDV/QS7gt1VQBwycRGBIgtjvtW5mXBUo
	4JekL70Ej+7yBP2macM=
X-Received: by 2002:a17:907:1c08:b0:c15:bea2:d209 with SMTP id
 a640c23a62f3a-c1f1ea074cemr282302466b.4.1785129034195; Sun, 26 Jul 2026
 22:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com> <20260727034502.94A5D1F000E9@smtp.kernel.org>
In-Reply-To: <20260727034502.94A5D1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 02:10:22 -0300
X-Gm-Features: AUfX_myLEiBJLLwKOv1xZ7uhmd3Jn_mkcnvtI6X82WndotEiSgOFdU_bkNoDXQE
Message-ID: <CAJq09z71XqApV8hWQ1bniEgNZ9nJfJwJ7p-CRu1D_MZwOOYiJA@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency value
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> By using this modified index to update data->pwm_freq, does the driver end
> up caching 11Hz or 15Hz (indexes 0 and 1) instead of the requested high
> frequency?

Yes. I'll fix it.

Regards,

Luiz
