Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C3D4A8A3F
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059268; cv=pass; b=beF/Vd/EpTGrGzcChA+x3uofc3s6vII6BxIFZjNION8kFCWnClZOmIKOQfOi3svd8vJ+rnon7Bmwcafu/MXYLXGrAGbfpYc6VEoSBDjJdmKmwYEVV4vUP1q3i+/zcly75R6ybWDQmFvI2LWumrogex0gNTXrGX1mJn0LjXRqMUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059268; c=relaxed/simple;
	bh=L04gHjCTBFQDXGRIDlSdQjb0Hj0ou645OgkH0Fdl5tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcBpiNS89asBkYWmrFaZlV8iEJzoHPtAvtyik6dZj/OZcxR3fBHlZvg0+iSQmvSgxufHa3Ry0/zTUt1UbNdVNFHumkISR4lBSw3q3meLEk4FuFqMLsX1T0ABI/i6EVNMQLfLCi0qfQB7aKa6SBRGu9xqM31/FeuV5ozUbEvYnw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=csJgdEHv; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="csJgdEHv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca7c1176317so50254a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 09:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059264; cv=none;
        d=google.com; s=arc-20260327;
        b=Unx1RDR1yxeM8wNaV93nLHJqsa8eNvMEG4M9pa69wEVXVMQed57yveL1PSTtwLIFNe
         6soyjxu2vsmHTHNMkvG0kvlr8Qnz/TjoefqWQZJS1iXCkABhTP4RTiF1HOw4shmTQITz
         UCmmkvQQq9aeKX+J3sGUlAffzIifNj7nHrT8pUA2SIrHxIUelxyzxfky9Ef71cVEl+ms
         m2IdYs8qUAlSO+Mu9iXINXVzqfMVcH6Po1lucNeGZHbaMCudHzKd0sKW0oPEBoYbvasr
         nl5QdyRrj/CIZ1S3RjIHNiuc2M6k0HMAs9N+xaffOKLxOwnkvwrNMmZHaJAW3o4obih+
         IOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L04gHjCTBFQDXGRIDlSdQjb0Hj0ou645OgkH0Fdl5tE=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=Ep+N+Fr8KDOxxF/Dye7/6mvPiz//rSImXQAmxfyLV/lfoD9Js3j70nmXLiMkmDnl5J
         SHD+aUWtjnPQlb4l9dfNkf/KZgQ4IPcnn6KYBFz3B1IDyWqEd9rGfTYVW4SrrWgpwSEJ
         QlTw2fG2hhk3O92VXrIlGmt1jTBaruHknzN39NUisjq9xjGySutKvmGI7G5XaiFaQHZw
         t/WpBVPJfTZQUxJer17+q2bx53UgPXE6w1U9h2NMR6FT1AXl5HHc2izlvLsYAsbpoi9k
         cxPT9Itqq9NMywl5nI7c0UYZOf3ur1gDRyfkz0ZZgf4q0myAmyZyrAgvsoFXZDWlcsyk
         faWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789059264; x=1789664064; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L04gHjCTBFQDXGRIDlSdQjb0Hj0ou645OgkH0Fdl5tE=;
        b=csJgdEHv5A+UzFXT9+0aEiP/O5RtgxHjt76udB/IiLqtJIRiCjVYYxKISl80Xg0bnA
         MFPg8NexUar/5KB7ZYTuFO8hD5PqMLR2/kVFvNDy4teOeeieW9xUXpHGNH9Xd36OCCU1
         UBpCsoNZ2xJ0b6G6HgyZg8L6y0hvIUVikUZXVNFfr7DnYdA3I2pT/4xxU4Zw6bV3ajsF
         xSba4wveWCX1SabUs+iGjDeogCgshkAnh2fPudSsgNX5xIfMp4GJSxvfn7mxcddH+8OX
         G9SGErBPiUzFVnoT3MqExkfxoSHspkgxLZSRwk3q5Nuz0JnCrQ/QohUzxEniuIfNg4AF
         6aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059264; x=1789664064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L04gHjCTBFQDXGRIDlSdQjb0Hj0ou645OgkH0Fdl5tE=;
        b=cdbRTmm2MVMraLPYM6M4TD1PaF+dC5Ii/MiSWXjZNKSzvd9i9DKVDCq7EkoE94l2hh
         MKHPeotCWG/iUzXnu+ebITaf8UtWU4VsSaLjGsU1gVfXBsKzJxXrM/LpYHQCL/G9ZfAm
         WPWgXVCI1lf4BZHL68vBrbaiLSKjMfJLsYDwdKq1FELf3KPXtDplFiXQj3R+KZm+/dvv
         DqgCwDVogydGr5JHXLDE6WmkQIfermuIEU7SFSME67d81vr20EzZC9f5/e2Jh60SwM8S
         TXZEXUYpozxsdA5WMq09clj8P81CrMQBFlSO9gT2osJJswrAVfP/jO8bJZ9YY4zffmc+
         oIww==
X-Gm-Message-State: AFuF++lCqDjsoL+aIs0Zx/gmJCeCJahOO6cSwGAn6wKDBNNnOgf/C9ev
	Rfq5A8nArEiyDy8LKEOMiPQr4lNIu+LLW+LBoebZ9DHeV3xO1/6vF1v3dK2rmvRGYzkf7E6EMqX
	98WDNTcucr+EBsUAJYr5y1PlPbAsanJIUcucAmwW+OkEvYZr26o7xGXsF
X-Gm-Gg: AYBFou0Mr7K3F7UwYBt8vkctwnKH7/aFgzIIJBzEvZasvYiXPFDc9h8ZdDLeeoVmhGp
	/ws/f2v0nsNa7KMk7lYnzk+Gi51lFut+Y+2q13SI8LZ9rTrptO+R9upJhFUqB6QRFiClLHO/kbu
	yAiXVrYM+1GeLjNzTNVM/fygg3w6hAMsadCePhufhwMG6UyYjiK0t9qNcpV7aSsvSGSOd4wQgJs
	KYWxfHjDI1+6Txz4RkdnMDVqGTd4d/Qx1O8mZaKa4fn40jV31tVzKtKV35DgVgzyxFRg3IgFgCN
	NqKa5J/kto2pOzA0hmPYNLjC9XjIEcdfYFjjicanssrFMeExNhBDrEFBkvoDVVq8eu+6U6pop6s
	dBCmJ9MCUbw==
X-Received: by 2002:a05:6a20:6f8c:b0:3d3:ae0f:5269 with SMTP id
 adf61e73a8af0-3da3a15c001mr67239184637.21.1789059264027; Thu, 10 Sep 2026
 09:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com> <20260910162343.4092060-7-elver@google.com>
 <20260910163446.647251F000FF@smtp.kernel.org>
In-Reply-To: <20260910163446.647251F000FF@smtp.kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Sep 2026 18:53:46 +0200
X-Gm-Features: AcwNN1XQVMxlxNRQ2rDJ4hYkHistM0-b8j3ztCWHp9GpdQyKNVbDwqVUbza8x-Y
Message-ID: <CANpmjNP-0JLRuabbZoC9vkB7RTuQZAuJFHx1VOpJWRL0LuLCGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 06/10] KVM: Add basic lock context annotations
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 18:34, <sashiko-bot@kernel.org> wrote:
[...]
> [Severity: Low]
> Does using container_of() inside a lock annotation attribute cause capability
> expression parsing errors?

Sometimes, but not in this instance. It's been tested.
