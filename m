Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066B72C0274
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035184; cv=none; b=EroHVI+nPpmNc+VhlK0bCn3Egn1G0A1TeObuo1PK04oso28J+ZWQZqFV3C9zW/2lbuW1g+F6L45/hlWL0uHHtewlErpa6HkzdLUj8+KZ7GZjLjaYFoDffh677aSQN3LoJMWoG1QlTc1djAvM/7F54dDdddDW3qvC108Pi3JwUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035184; c=relaxed/simple;
	bh=gNQbWMo3+xuQy6Kz29z7hYNh1vRqVYw1Xiy6UBJ5LhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lmt2BVDI+s0O8s9U9GbnmZhhzi1SduK3et4SQc9hxqYDgzYghkM9fhU4ge1cM3rSd/ALa15KHnudYrVelSed9YJEVwdHHK953FmeuOFXXzwep5GtIyieJceinZxLnwBmdm4sWQJLAn7S9RhCAERWGde5AdgzZT7ttLB42r1yYj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I8TZWtYD; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I8TZWtYD"
X-Gm-Message-State: AOJu0YwUSt9ZTjG5ZnxN4ovHT9r2kxvuKsznOFtHeu90/qv8KOjiYY+s
	/eUgkvOHnz0SJ/5tTaHQB6tjyodcYdbJv2dwcFkevLmusTOZyw3ITyMXrurQDTKD9/4Nb3yf+Wq
	lJqcx3SoJjFtUKTapQjK5+gggQBjs61ztzavvB7Cg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784035178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MisgD/Dm4jfxdL+N9uTf8UsCLM0Rw/O7yRZ2Ejr0nAU=;
	b=I8TZWtYDQdpZnfMfri4VtH2Bh6KLvtVJkkRPM5wUUbZOQQ2v8eStXy/DtahdjVzEPJuqLq
	uYA8CiZWriHeHRzerb1wuNUjpFgWJVnznFxBofk0Oh6yFpgHj57Nd7yNvL+qraI8Z2SjT+
	jL24mLmaYklloztbxBnmW6L9equBlnw=
X-Received: by 2002:ac8:5787:0:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-51d7bcc7aacmr14328561cf.8.1784035170138; Tue, 14 Jul 2026
 06:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714091641.1970822-1-maz@kernel.org> <20260714091641.1970822-13-maz@kernel.org>
 <20260714094609.4ACD11F00A3E@smtp.kernel.org> <86wluxokv5.wl-maz@kernel.org>
In-Reply-To: <86wluxokv5.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 14:18:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzFRbu+woK8yyGLdhrVe+qEerw2cZVaQ-06XKDx8mX8UQ@mail.gmail.com>
X-Gm-Features: AUfX_myOmQ_-286nUyOzdr2MXl-dvEjJDih84jWWsiAddgpppNcY09PrjHTx-ho
Message-ID: <CA+EHjTzFRbu+woK8yyGLdhrVe+qEerw2cZVaQ-06XKDx8mX8UQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/28] arm64: Add FEAT_NV2p1 detection
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

Hi Marc,

<snip>

> Fuad, can we please either teach Sashiko about out of context register
> updates not immediate requiring synchronisation? The constant
> insistence on having ISBs all over the map is pushing people in doing
> the wrong thing.

Done:
https://github.com/masoncl/review-prompts/pull/87

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
