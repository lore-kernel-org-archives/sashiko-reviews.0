Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3A2225417
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219421; cv=none; b=UnhAmOMILTttQt520Bm7okSkp1CL+APVKAduyMl+EmoNKdpnLrcdmmjJ9FonFP24d74fVIpafphIECED+3Iq+hMXOzX55QdaV8zTnrtG5nmXac0Lru5VSRqUhtOn9xL8IptIIkxFPpZwzCyyPM9xEw9UmtOlC1kc02XEMik1QD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219421; c=relaxed/simple;
	bh=cYciK/K71PU3bqDNjuY+Q8z2fxXYxDMG0vk5d6ZKjW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V0o4eVhc3p66aoXXaVFIiu9DBaVD7cVTJCeFO+ZGsQ/gtzjr+IOktSFYCf1fTVrIPGjep2SDq6xrLIPAfFPdqZebOU9CQB5zlhM6IHF1UKDUuq59hcrPLxxO3saityLb/gNQkY104EikXME2abSvZQpsxkXSt/emTQZJsEQlwM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQSRAqDr; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQSRAqDr"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8428384f31fso4010663b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782219420; x=1782824220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYciK/K71PU3bqDNjuY+Q8z2fxXYxDMG0vk5d6ZKjW0=;
        b=PQSRAqDrsx13Sn9qUlKib3z9OUBQ99xWgoIgVMB4BfPAtAhsUoKfz0khHG3pocEi1Q
         Vf/mcrhonEfcwl4sHJZkl5i+aNkSnMBlYqF7wcCSq3GJ3/f7wzvnfWJ0GR7PabSk8Ua2
         /WlAdJln4rtCyRzTQ2OHx0jaX65cIsBlcKUie5e7B1eZylXJSYH1Iq4CMUdW6jUxMIGV
         XoOA8yt0evl7pGdXO1nDBS8OHiZZ5yjNAHonfUizoWTYDjFLhCKIR3dNwXLikhXZeQU/
         gsORvpr8CFeqkIUhDC4GG1NCqzLAKjUxLOIVQbvesYc1AV8eEMOFVI0Ct6+R/wzeUNAo
         SpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219420; x=1782824220;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cYciK/K71PU3bqDNjuY+Q8z2fxXYxDMG0vk5d6ZKjW0=;
        b=ge8H4MhM6+ymFQCYitPEzkBIbRjv8yZOc5vXtVpWYe7HZc6v2joEoi4BSfdfiwRDkd
         VrEH+UijcE6xtQeG6bfaAjj0C+uNuwq9UjkZXL9r/JGaP9dH5E/PCfer5no/nr6au1Ej
         ZHmHLGGH9PGCtm2I6iG50lwacH/H8/Tu9dC6eC9P4tIhVXJorwCMbylGZDB+qg/8MrME
         kT6k2LFcjRh4jC0KsPP0YAN+205SHF/4F8XyUkghNa9FUV9D+ZlKL9eYgtOgtHXju1KE
         4a4ein+JoiDm7q5jB+QFJtKfqRyuRKmVPnuVct84FI5Wp4uMHK87/WkafXpVT65hEl54
         GjDw==
X-Gm-Message-State: AOJu0YwiZezW18RaxtSxHtw/ujiA/ddXG1m9VreRckj0+v/Xn3fMzbrX
	Eq2jJBuFgo+W5ULX5IZ9j2glnNa13L3qIJQXg9iQ55vHY2W1dfhVwmSQsdmPcUW9lzyWDfTz85U
	aG4s76w==
X-Received: from pfez11.prod.google.com ([2002:aa7:888b:0:b0:844:e56c:ba8c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1f08:b0:845:43d6:14d7
 with SMTP id d2e1a72fcca58-845507e017amr20047637b3a.16.1782219419781; Tue, 23
 Jun 2026 05:56:59 -0700 (PDT)
Date: Tue, 23 Jun 2026 05:56:53 -0700
In-Reply-To: <ajpSF6HyhgBA3uV3@8bytes.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260623091556.1500930-1-joro@8bytes.org> <20260623091556.1500930-3-joro@8bytes.org>
 <20260623092417.5964D1F000E9@smtp.kernel.org> <ajpSF6HyhgBA3uV3@8bytes.org>
Message-ID: <ajqClZ3kHfDcCxUe@google.com>
Subject: Re: [PATCH 2/4] kvm: sev: Unmap pages in correct order in sev_gmem_post_populate()
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026, J=C3=B6rg R=C3=B6del wrote:
> On Tue, Jun 23, 2026 at 09:24:16AM +0000, sashiko-bot@kernel.org wrote:
> > Should this second instance be updated to reverse the unmap order as we=
ll to
> > prevent kmap stack corruption?
>=20
> Yes, it should. Updated for v2.

Already fixed, commit 138f5f9cbe37 ("KVM: SEV: Unmap local kmaps in LIFO or=
der,
per highmem requirements").
