Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D50400986
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235246; cv=none; b=QM+006VhBe/qsljSTOkNnc/LIoBuu3azUQwn/qJXN01v1/o7LiIuzITk6evVliXvJ0GN5fMxbuoYprZKPKWZ1ahLuD/3u45jB5PEs+i4tljsInoHwK1wueEZNWUirEyC4JOs614TW9ghuVR7p+LTeyTbW9u9gkwMb32eg1hHr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235246; c=relaxed/simple;
	bh=eKEhRWg8r8lcVQlTsVVu0qrr3lXjUZhkr92zgqGRhF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWefqWIBnw0QrLK1+ZzAxdQub1IuSSAHZnDGVT/Ybl247lsxim0DUGs9QbJjmZ9M7dp+LJ0YscfjZqXNAWQHk4nsYRh1mZyZlBo9y8/OxgmNza0D8Zz1W3acKrZlXFDYNWebgSssozHF+j/gkZXuNcDRERLpIXX3yMdWWU3IZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=cxPYCqPW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="cxPYCqPW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so21393895e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791235241; x=1791840041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq44C5dsPAhwLXRlUUC1A0u7pKaUDbi940VQRcT8enY=;
        b=cxPYCqPWDjvjrTITH8oXdXZo3uOivUy0j6yeCiQwnXG5v6UJ8kK+ynr0rPaSjlNq1/
         PUwVlfSGups1HFXV10o9+5UBp340Tnca8RQRsz0fqSHC/V5uz6GIzXiq9eTElJPe8f9t
         fwnGUkbuh5+ocWY0LTIaETQF1DfPdWoQ6xBqbfAZd2FgTQ+drB5MzEwAuZKoxFVhHYF6
         Camus/KosMrSuPi2/POfidKDmmBpFABDlkON6h/aFKF9CAb5aP6cLkk93hRyJS31W6n0
         wdXx3mUtdFe+SEQqAjiqOtUcQz8q88BrhBg2euZtwyvRJkE5kem470a5S/6NfRn3C9+N
         YvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235241; x=1791840041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iq44C5dsPAhwLXRlUUC1A0u7pKaUDbi940VQRcT8enY=;
        b=k0V2GOxzn7dXmHGT4Q1xSa+svQuohzevYzvBvBOqhEVFOjzMeZ49QZlbxBZVYEmP83
         5LkNduY+d8u9i09OvwICIlIrq5BXX356VPxRMWla/Kkpiz0kta3wGbZT9HUlH0Jl8a41
         tG8CImPrlEsAev10l6Td4Db3sEgSWUFpGTxqImHk89iKuIV9+582HGY+LSmSBdYvpPvT
         gfB+7jRJsmb/vxohDLMhuPBT2rlp/geb6oXJnz/bZipXt3uomXvN8oTsCmI+5jT/B7g5
         +DSvy5D2GcguK0cZ+rFLoexOIbEE2GrLBS8dWgGDdwcO57hW13I5UROMMzdaf+z+sLDd
         lS0A==
X-Gm-Message-State: AFuF++nrakwqTIJoT8vX/XguIqEg+B62B7tnlLh2U02uVuuC+AHWEQyZ
	dyqOaOOr8vRw+wAWqB4DwsJT1rOxWi3vOf0ZzWLuigDvx5Ev66qMxOf3Bs1NpkKJ1+psKbqjSgt
	LMJUYaA==
X-Gm-Gg: AYBFou1J4EuGVK4P/PDKqvCmBjxAsgi0MyXv1/yb5/oPe21h/R2RMH5sqqHN3uRbu67
	Rpg8XF/jIGPM0Jo3gl1VolxXhWiyDtnII9QV73odoeS35Y9ahoGWtewZ6trtxe/jx5K6AfP/kxr
	d0kLR7VvbwcgfAp2NcGBDxEP4mjz3y9XZuR2qkDxp3tFVEySy9ln3vmc7BBKZacaMEdFPAN3li6
	ilBkYUY9Bz6xXKW+zfqu6rTl+aLHGEWqn4NVc1g/+oBxjdoOSSJivNPSU9GlgVxyOOHGUCPWmDp
	rIYHd7Jz0EHvGEO8PWXgvtKX4ow4VHL67F2LM2TdP3T3m5IIwVxPFqexvOOP8lqRFgSKRoc1iTv
	8zYU187DEzpZeO/RdYziX1ZuxCAid5uUgGLECqC1/oplvgvzsoFOPQ6Ud+rLJ/9jGk3HqfHfqYB
	Wuu7c7lDZR3uZIAOKDwlooUESiBK2jPRwL6feZKf9eh1ZRMBpGY+EvZjmrf/mV31u03etN7l+4G
	l4qgIH8uvEn7tjuqVM/y/bDpsURPWl9+S04cHbh0ApisfWELQt89RO/9fSWpRdsPxrfat2bsYg2
	7J1esX7/H/75D/csAZbHAoZVVXfqOwBr5s5K7d3zXo5+Db5CxP7m8W9A+culzi6Lz2dCQH8AQeE
	jnJH3gxtKSyBU9xGlRauX0wGU9JSIva8Y9ocFnDGdfZu+Dfys+YiSfNY6mL8TegTceQw=
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6843:eabb with SMTP id 5b1f17b1804b1-4a16843efe6mr133495455e9.1.1791235240914;
        Mon, 05 Oct 2026 14:20:40 -0700 (PDT)
Received: from Desktop ([187.40.54.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca8127sm18607725e9.2.2026.10.05.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:20:40 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: sashiko-reviews@lists.linux.dev
Cc: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	pablo@netfilter.org,
	fw@strlen.de,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH nf-next v3 3/3] selftests: netfilter: nft_flowtable.sh: check the priority a flow carries
Date: Mon,  5 Oct 2026 23:20:17 +0200
Message-ID: <20261005212017.2997-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005171647.3D12A1F000FF@smtp.kernel.org>
References: <20261005171647.3D12A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Could this introduce test flakiness due to a race condition?

I don't think so. test_tcp_forwarding_ip() waits for both socat
processes and compares both output files before check_priority() reads
the counters, so the connection is closed by then.

check_dscp() reads and resets its counters the same way, and its
"dscp_ingress" check also expects zero after the "dscp_none" run
counted packets:

    check_dscp "dscp_none" "0"
    ...
    check_dscp "dscp_ingress" "$pmtu"

The test passed three times out of three with the series. No change
planned for this one.
