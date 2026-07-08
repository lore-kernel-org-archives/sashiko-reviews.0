Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D52DEA68
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551923; cv=none; b=mgEvRydsUcO3Hwr3YYez6MXonT9VU9GSr8WdQnU5IwzS/MH1itb9bNJek0WIVU83AMsk5glVx871Xg/RsPbhmdlEwO1NfeAR3Gk6IsfOp/kXku1CrYNp+A4NvmqY6kFq5u+VmV7Xlb6hEt5f0UFe9DtAaIgREDVsO+dujAgDJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551923; c=relaxed/simple;
	bh=gJhnwQFyZZPO3Q6Dfku0C9MgSivyhcyGuzzoGKK9WGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUzO8Kcf46vg9/2Umw5YfE48gGrBoFeuJqhONNGl1eQ8PfUjwqPxrgEJrWbxvZVqcN8uwb2ZNwkUz3T9D8y7ZfVVn4jIF3Bk59joC12R9cOeBldr3iFP68Ip7eL1AfPITJq76/bW/GizgQsmeuA/CxayB3vPlY27alS1lI7Gf3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5F+Ll6J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5F+Ll6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDBA1F000E9
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783551921;
	bh=gJhnwQFyZZPO3Q6Dfku0C9MgSivyhcyGuzzoGKK9WGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I5F+Ll6JGJTNAb8qRo5hi7TIglSrFCNmRjIFCYmudqwe669CoyKMjwerpNePCksYu
	 tL+paBKot/MGD3xc9PdiKY/IK+NvalrDSrDFRpuWKEZjfjyalXThkMtUsZJXqRsEzl
	 DcV6T6lT1pz9HRe3letnh2wo7/n5g2XqMF1ihaIexQsBzeLo9o8mtUxyzkoth1CJoc
	 GgOpk+t8F/bCH3BNtATRnz4jO4jDSYoLQDGB9GK9WvdoqQzhAB0puGo7zPIqLLl6BL
	 MT+jFMdl7bsahRxGu2c5NnEXckNV/IfbY8KmqPmvs15yEIqs2u5tu32eniR2GhpZI2
	 SGBo1PPnZB1yw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb2df5cc1so1081344e87.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 16:05:21 -0700 (PDT)
X-Gm-Message-State: AOJu0YxP3uKTam8tA+Vqu2URVX5C8uQx98fenle8kwMEtEfRIY9ECRgs
	jIxU758ivKvEPViw0eN3WgvG8KhZiQV8JO1NJv8CnICkJy4UZMlU7cucgyTC4Tzq5GZiw6opm8z
	gwKkAeUw20r0FnDu8zD4ipSfoUPRL9VQ=
X-Received: by 2002:a05:6512:2216:b0:5ae:b232:ec03 with SMTP id
 2adb3069b0e04-5b0114a85ccmr1074846e87.42.1783551920312; Wed, 08 Jul 2026
 16:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-3-e9622d0ba9e4@kernel.org> <20260708223310.71F431F000E9@smtp.kernel.org>
In-Reply-To: <20260708223310.71F431F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 01:05:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLnTzXLSkNA8WGci2BZHXTc=Tzt3UVm2uVrsSdmSCHaCTw@mail.gmail.com>
X-Gm-Features: AUfX_mxXZ6-7xp23zFqGb8rY9ywZAoUf1tULVamM5PyyuWduXSwnq9JiMjwOMJw
Message-ID: <CAD++jLnTzXLSkNA8WGci2BZHXTc=Tzt3UVm2uVrsSdmSCHaCTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: ixp4xx: Drop the reg-offset hack
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 12:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does removing this break big-endian serial consoles on IXP4xx?

This is solved with an orthogonal patch to the serial driver.

Yours,
Linus Walleij
