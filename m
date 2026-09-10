Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4F23507B
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 01:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002626; cv=none; b=EIOz1zf7JQXpuOyO/Pblk5wp7XR+S/CsZ3QBeFWy3YHtwO8BZUx1TptqNnh89vyV9NZouf7aKk/29qQ9DzcvU8lAaPSYe9wQJwIpLabYZAje+kXyHESyqTkbKZ2WUk76+Fjd1pmdn1uPpJmXpQitbLf1DsE5x2wqqD/7nEJ3yhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002626; c=relaxed/simple;
	bh=6a2ZbMEkIiw904HUxdkFsA++lslFLkj9V9JCozTDMBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNOFJZrg9eNPZ9DQQrQKrYY8tGXdoOyDrg7oondb93LTNbWLvSHYMsa9Z3mb7gLEN9kq4Hn31bWYG4hQqFJedvFJ1FGwrC/WQHGBlxa89eMWiqzUld1A0UXMduF6eY39+yGGHe3RjwTsFW5GORpfvFEkvA0bGa1mcy3AUVWE/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMC1OoMn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMC1OoMn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso8451815ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 18:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002624; x=1789607424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a2ZbMEkIiw904HUxdkFsA++lslFLkj9V9JCozTDMBY=;
        b=jMC1OoMnWtfCr+2OsVISiToch+qvQ7I/Zx36d2eDK8ExxZeYEbCiPkOWBMs6HU1sc7
         q7dnrC29eoQXuQCWu00ZpZ1bKpdMoxhJAVqY64rWVLpjgUm23a1dzKDQ7MF4+YLbjuJQ
         Bi2uTkp3xKg81F2kL9paTvjZefC9POWT8YZ2lyDqxjs0ctri5DORmcQy+NakarejBRtL
         9ATNm/uVBuwFzHYguG6sLdwOC0oQUMnaIPoYQ05ZOjuT98RyjWlnt8lUJ76/Uqoj8V/1
         uufJK3sO94IEvX70ruytlDfErKRwgtZqNAsQ0YqMSKm0kTfi7DFZOmYIjLeF1/0ZRVPb
         l68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002624; x=1789607424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6a2ZbMEkIiw904HUxdkFsA++lslFLkj9V9JCozTDMBY=;
        b=Q2wAoZDS6Ni15AWJRXu/71zUWqeqOC5XXT1dhRa7RL93D5lzSBnkjj8w7At2Og0Jsv
         34QWVj5wIReN2IQloHLWSj/vep+HPMWDmeLrNkAZyaXYfBiLAmn7RUZnKmkyy/YSKKxr
         Rbo/ZYtlDb/9TKYxLsOAlX7qh4VrL9f/QOLr35O+xYB2ew5wPDh/KuzpmN7XZ+DIQ0vE
         VqxE77aPrfNUPEkaILZhvtcL5GSyjIeqr15PqutIdCEYYu/17mWlchl5NXU6WdLUaoaq
         L73W35B0MIifmwKc1/alE5gBXh+Ebg+0cXl0rP9mawqZ8fO/hW2ZS0aay7zbX9JBMbEc
         JY4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQVT/33TVTaDww8K3LGO5BaMcoQqNSFja1sPkkg6g1H1FlQM0N4/hoCdMIhyGRGYL5T63hp44aWeeYBysa8RU=@lists.linux.dev
X-Gm-Message-State: AFuF++lSOau1E4hUWEpCAo2KIQN6ETWHxpo25/LLeot3qnbZzshrdrHf
	rcV8Ff83khuHspC8/4XKZ5JT4gb9J3XmaUTqhJf5FAj1FjQ2z5hCl6o=
X-Gm-Gg: AYBFou3gX9Ug6AT8PF70LCYQo01s2FLdQEo3oGck5Z2TZMzZyMthuBAyGZAT97gcpDB
	872F+htHPy6KWUVxnmINzEBjc8474M1K8JDPYXUzF29f40kqG4ptAhvmUiCEVjsXmRDHy+oHyiF
	UgT14n5lBXDH5EDETlAwR+izyFXsxlkO+KUpPVfLK2Vpm1+rpvRbjkQUbDwx/K00W3+eWTjfi0p
	sMRWl+IWL4rgzuPp5Wmwk5oUmRYqIl1P9smEqRBrO1rCvG53A/ZFKZf7YiBI3YkZIjPI+EAo9zb
	uvahugNy8dECJKBa+ccFMGtEoNMApw1Wa2h8SlOu4DpOxwiGGImMBxeif03kFX74iSzYYM5lTtu
	s8yn8y0UVY1Z3bx51TvHUj2mTCZRW/V0m/HZjZOyBQmQlpE1606oApQTcIGDRMQWf9WitIHpVo1
	tgENCiPMSugPpwTNzLMRdMKk4LSCc7BBp8H52nG18UgbqUp2EMjzIgnQGndotMuZ/+0+piEb8uW
	qYlmFRXsr9pITDbY7FYV5J/MA==
X-Received: by 2002:a17:90b:3b91:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39d70b1c48bmr5704657a91.18.1789002623824;
        Wed, 09 Sep 2026 18:10:23 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm2251431a91.15.2026.09.09.18.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:10:23 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH 0/2] tracing: hist: two named trigger error paths that free a published trigger
Date: Thu, 10 Sep 2026 10:10:18 +0900
Message-ID: <20260910011018.532378-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
References: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sashiko AI reviewer reported these bugs before I sent the patches, in
its review of "tracing: hist: set the trace clock before registering the
trigger". Both patches should carry:

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/linux-trace-kernel/20260907092944.3950E1F00A3D@smtp.kernel.org/

No change to the patches themselves.

Thanks,
Donggeun
