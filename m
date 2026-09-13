Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801DC3C0A1B
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 06:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281462; cv=none; b=ONEBWQlnZmT0sW2z6DgB7tEZMGNxRvupuW0UiswSXYEBFx0e+WYvzr/cYyLYscUGURiFD5liEfOPmq4ySOj+2yQ0cx09LpMXTwX9CoRL14pFUSDA5hyiZLZfv97EQZUbVaoJj9rD9wGadQRAv60CBc11ty2H9uNuAzCj/180k+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281462; c=relaxed/simple;
	bh=EaOmmJJC3kV/y6g1/KOXknozM741k9/ONn4JSj6RC2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWxz7gJB7pjtF6h6NLmadVrEow6cjjjK2ifaofKShn0Z0Pvq+4vYglBLBAZlbf4z56w5YsFto3RsHoaDo8IndgpeefUYhAXXya8KwdoyGknkx+vPiF75o5MkAJAiAUgx2JHSRZbTAUHznTb9L687XtF05/tsJnmSOHct4vq/MY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/RwofI5; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/RwofI5"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1070455a12.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789281461; x=1789886261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5b80pzerJ3gCHaBvR30moKiKA9qUlNZYajnhJLIpzk=;
        b=R/RwofI5cOrfD43W0f+Wj3fGKmcCWKh5SHbo9bt5kmKwPUVj476oH4HymNGgRuaF3V
         5yoBg3+pijLKs9UZPyFvYcT/B/k7NPPWZN+MIP+IdC1S6clSOpd5qFxPPGIihUlJNVgI
         1uuAGGEJbUuSflDwj+FyMB6LmALOcnQ4Alu7i5vO/TyT5IyGeuHR3oPu4TAsXKo7gESr
         LIzaDj1vFv54hKBkJmsMvkg60HcD/WocYWCvN4ZSJQEHPpbi8EigpP7ztVRGYnXfc4X8
         tm0SyGyvTuClXSNsrBpTGkzGkeogteqOOcWL0F3cmcKUjO9wiE+nPg14t7BDV1SmxjCL
         5FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789281461; x=1789886261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5b80pzerJ3gCHaBvR30moKiKA9qUlNZYajnhJLIpzk=;
        b=hjflxyIREnbm7PYGKHbcU5qoRxtZSRhCWYTjup7Uz2+NH6mZC9qfQIPoAPnZKxe57W
         m/mQOPyfmaYERmnZyRjW8FFrhjk+1osPOpijD2jLoOx/EwFSjJGn+a5hpJdSeDO1F6ot
         Xw7ClKsEzAuz38dwGSwoS5Z8FzZh7h0rea+gv5eV0Wq89DvfkkUtQcwDS1T3x1RlB+FT
         eIf+49kheZ1aTwyQAGR32AVDdyxkbiOUxnUhlobOiuihBIqS/SmKI9tZwVTW85CpmJVa
         5nseTjKFcVw7Jm0n75UTc0nd0uCpZZGHiAtp0zNB0VDm9h6MpbzrBDjgMk2Q4ZIjL4NG
         W5ig==
X-Gm-Message-State: AFuF++mRm6ITJ9pjSGjYSCkmKsmm5wbPGTmGphjcoj3yBx4SY9sDsoyw
	/ojAsFLjcctrqHHE/ovTobAT0WYnd8yNdagjzJZ8auuYK8g3E3WZk0Z9XJajbNI=
X-Gm-Gg: AYBFou0SUISHANq9JghCxcGBIuVjThLDJ/p34xACelcx8NitzvBFVc75sr1L0khvt/s
	HibkVAp7H1aOXthn5zjM2L0d9bt0l0UVUqGSgU0NXEy9JmajcfAyJ/KoIHPR4LuAIyZ6YlQ7UWG
	ijWO/ZX9Z8AKPkY5sKp0+kRPz9IeVU6Mr8N0kEWNkRhQrxlfqTuqkLgSNGbibnCaK39zHDngHYB
	8UY2OnOvilWncdgCAJRK8amYX/IRRDHPoz2WuK/ryQo1lxdkVEtEaLGaMUlC1aHzfZgQy4mK8WY
	jK5kdUX4oPycJCecvtuJE4Ss5bdL2j181vX/G/TqU8cYWHAvmSKPmQd+lNJLov13d7hVGvbCnwb
	gaVu80x8UEoZF5DodhJmeEpMr/3TJIlQ0iZie1sqgWpS5JCZDIJhRapwB9cq9JEZVE6k1MBepBl
	ObVlufrxNGfoVwNc/LkkgwkrW6ZTHDoMgFAU3HNMX86gAjdzDHFIRt0xDw3uQg+AMYCzFaXW2z2
	a5yDFF1yGDlzlT9+7E2SzlOnQ==
X-Received: by 2002:a05:6a21:6f88:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3daed2e2f72mr26462406637.13.1789281460900;
        Sat, 12 Sep 2026 23:37:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b91:ff81:c860:362e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6585f94sm3253291a12.25.2026.09.12.23.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 23:37:39 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Adriano Cordova <adrianox@gmail.com>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] blktrace: build the synthesized v1 record from the entry's own layout
Date: Sun, 13 Sep 2026 15:37:34 +0900
Message-ID: <20260913063734.708896-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913031030.E85191F000FF@smtp.kernel.org>
References: <20260913025827.457116-1-donggeunyoo.kernel@gmail.com> <20260913031030.E85191F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 03:10:30 +0000, sashiko-bot@kernel.org wrote:
> - [Medium] Size-based differentiation between v1 and v2 events causes v1
> entries with a large PDU (>= 16 bytes) to be misidentified as v2 entries,
> scrambling output fields and truncating the PDU.

Correct. A v1 record carrying a 16-byte BLK_TA_REMAP PDU is 64 bytes, the
size of a v2 record, and nothing else in the entry tells them apart.

v2 drops the size test and depends on Adriano Cordova's "blktrace: always
record ftrace events as blk_io_trace2" instead:

  https://lore.kernel.org/all/20260913063155.708520-1-donggeunyoo.kernel@gmail.com/
