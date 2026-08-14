Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801643CFF44
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786725811; cv=none; b=ADiBSaacEjm2LaD9SU0t8Dt0AW48cbaF/g4guB0ndOLGpXQ99pjTtt+PKalPk/nRdt+yPXGNDSwLxzV5nab0fd20QYpxAK1kvasJWcxWpTt27VMOpSAtRjhFMYX6ZdzTmOgLzdDm3k6yjU2rahrEEWvbXObdJjwQOUx20d6LJ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786725811; c=relaxed/simple;
	bh=8PPb9fnW5inzVvVJ0q4AtntZzt01JJ1xSrRX1Jz4xDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nJZXYwRCJpfA3TEjJZriFj3IwJa9yc+heK8S2pUsXOjD7b0DXCB/S5G6Zp/8PYoVgVeGengX4KAgWGLuTqKabYrAGjjWZ39zPDTe0Uv2aNTFPVpIMgAohj9dzvxE2gAyHRmJNcsxk25m10Lb1aaeXAQTlJ5gy7zR55EZHuQngN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t8vCjszF; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t8vCjszF"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbeeaabcadfso1266179a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786725808; x=1787330608; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PPb9fnW5inzVvVJ0q4AtntZzt01JJ1xSrRX1Jz4xDk=;
        b=t8vCjszFW+HlBAWxfdfG1b50cqfFI+zG+/7cgzlVl9BO1MWY/Uq79wtMm+fbwuyVAi
         HvezUcGy4smtLfZSJaPTTZCEvm9VwKF74PPBu/k8u8yFPGLPCFHwIIEwXV2z9VcZW/ID
         WTA2UlnxPmeINKsn357twVwfk7M0AFiPeVYWsQDqu0JVkA/dT3sGKA1zXMEeVPW5PbkE
         Am/HfW70UBuLxjd9SDxI+wrCSikQb7ZZwW9S+biQTbASkYOI+G9byIESIYyskM9rrzP8
         285bkby+WaVNs6u13K8f8e8EGZMfEjMRqKw14Q75FVZsqMvtYO6tfDVqVGtoeeckOPe9
         aFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786725808; x=1787330608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PPb9fnW5inzVvVJ0q4AtntZzt01JJ1xSrRX1Jz4xDk=;
        b=Y4c5dtHW2IojyZI5cMezFIveioE/TqI0TOHz+kWW+k9YbnUvCXnCXB5HYqVIharoPw
         zwRcqxkc8IXV2sisPbs6TuoTIowebh88i0exngcuNXt5kAt5bQppuUusOE/am2bxO1Fb
         3CpTdNORQU5Khnwa1PPFauLGF96JYAve2ielIVMSLrY7p48vj7ZUBr3z5fcIAgVb+d18
         HOX9MEfr43Q7yBhFgwezVoT/1nZskgdIXh5W+CtExgdhs+ctIeDq5GUD/BkAxt+vUaDd
         FiRsrt39KVoqNlZchQzjKXtGERpeD+3lwwH4SdpSQPCZMcnhJjKsJ/ysOfx8jmTAUAZO
         1+9A==
X-Gm-Message-State: AOJu0Yw/Q8jaQUrO/fyLgk8vgcBQvA2e9GMuqYPEHUI22KeHpW8ZS0Jy
	C3ihXjDbMQXJW7bc7OYqwzPYEThKlHxvEz9N66ZbMpGWoocDwKRimfklr+WfNygrM+KKPQXhFF7
	PBcVdOD8t+b4MGptGaHkesB05xNn4vMHFZ1y2jBwkYoMd1L6N3tCSEuMNIo3MrnHhCyVyjcjPPu
	gRUtrMECV7f7hlkp/OBNpWi1U31KUscy1U2ZSyLCAhLzub8mg/
X-Received: from pgbeh9.prod.google.com ([2002:a05:6a02:2569:b0:c92:864:4328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:301b:b0:848:76af:db37
 with SMTP id d2e1a72fcca58-84fde11e1f5mr8614245b3a.7.1786725807369; Fri, 14
 Aug 2026 09:43:27 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:43:26 -0700
In-Reply-To: <20260814163137.297DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814162221.2144473-1-vkuznets@redhat.com> <20260814162221.2144473-2-vkuznets@redhat.com>
 <20260814163137.297DE1F000E9@smtp.kernel.org>
Message-ID: <an9Frud7pHPXMFRN@google.com>
Subject: Re: [PATCH 1/4] KVM: nVMX: Make VMPTRLD result in #UD when eVMCS is used
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 14, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but does handle_vmptrst() need the
> same fix?

LOL, one of these days Sashiko will look at the next patch before responding.
