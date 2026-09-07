Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068D470EB9
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786849; cv=none; b=CQ84mItMTUSIrm6zjWSKB7DBoDza3KqyTZqfCqNJi1jxX5d2zJbIxunfI+nuenDrCH+fFtPHFYttV8V1tR+FqCd3fcO15vzb6DOM3Ju4hN1xn3dbR1GvpwUedkpoH/U62c2Tc5UBK5TUbOjXG1uaP3gzqZTGPQqYShUXotScenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786849; c=relaxed/simple;
	bh=dWzNR75g7GxtOP9gnAemxDujVQlcOaJPEWJ4zxqivnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiwYXhFu1y6OdtdzDjiZZSXgd+xBJFai4N7aGJ94CS/PAaH4ZtgLggeoqIagPAI6R2ioudIfLgqHwVXR68OsfA796ywx+rNH95DJLpKqM3QZNz/Ph5wUSAI5TI1NlhwYGFxotrMTbFmcWPOLLiZ9Y2VAFzOj/5whlWpKzwlYmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhnRiU2L; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhnRiU2L"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so56635a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786843; x=1789391643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBNOe0eEjUTG15p8/eAAeCa3HJjbYU/T5PhuLMghgho=;
        b=RhnRiU2LfPc7py7/6/6bIF2xdV7xUTLkCXavvjI04Ae1FKXpxXj9Sig4ss5yTtxufN
         ty4C9MX9xSuIw0fXaAwTrbdek7uJzEW8L2723YQR7pjGa9xMtHkrDgxsarDLasUBmVKc
         FQDOH0MKELa8jnT8PzjghASy0OrMB3WG38mDKxtR3ZmlkmRvasIa591DdDXB0/wTbupL
         OyHzlk3Zs5y2CXmOEUYLQIuQC/Kegy/JeCnZ/0w8oIx1wNyXREl6I6B3a5kUPDw8CT11
         1j1Vs1Q2E5DeDrZZUkBXBtNvvPAtlnoKA1gBC98p73qu9+VY/z57j+9XlyvsZmYKvV2r
         ZPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786843; x=1789391643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBNOe0eEjUTG15p8/eAAeCa3HJjbYU/T5PhuLMghgho=;
        b=iyx7aASrEkzkwUl309QsG+dUS2G/Tz4CPYRsW3h1ErGpZTBBN0CRgv6INBE/K1DHkT
         A27pzRGBv5pIYL3nye/KxDNJqxgTeHYs268EEmOC7ylRkRJgshndq166gGpg2ku1g6Xf
         EE1diarIzPQGIy2KAP1sC0EbTY1wyGUJoZQLRODfl28hMoT5Gs2JAriR9sY4XanXLKHU
         EtZx1EgCYdtGT5WnCskMv0szgZwP9KChOg+WBJ/4BwsFgw0+Gx94KHaHv61XuNBna38k
         3K0Ju/hQaDb7xeTfCJQ2b+UXvTFO17t2Iy8x6iW3EL9sjuIUmpruYDlDIx6SKnU99mxL
         E1dA==
X-Gm-Message-State: AFuF++mLc53Dm+aZ59DfYUQcFKcbe6bJcQFzNwNChLufxxYcvQsbgL4f
	+AgHF4g0b3sNOGkNAKrOjAlZOmxfv+aEPZWN3hJf7JBlONaHdxr17nexLj3rYtE=
X-Gm-Gg: AYBFou3S4cFiSDIRm4o+ZEu74+DXEUJ02UxfP0pzz9HQvcJnAC+nG7dZTKn8Ga5owWa
	1Q4+dBMYqkz0I7/4devefkuyM3LTU+5JmpQYqv+bMMtO5Pil+mqE8zb/2x7OIrKm6WEitupvfO1
	xl7w6wZdBa8OiXT6ncZkstOlnvZ3KXh4Qj5N/aWI2KA0lseRXaqxyEfMFTTBlS977eQEviJRZyC
	Jl0MSiTFrqTiWk6uvQMjjjw7LTwFjh4iSMFpUCt/4liP70KFNY4ZKYnSqy6R+vD07wwHkNnYltt
	9roJY/WHXlriD6WyStP7Pum7hpldMJMOhyn8hvpHsSHFt2mNs+AXoyO5UHwiZJdJuojY6eNC5LE
	a6t6P2pulbnwhhLlvlUhCt6/zXiiP30BXJeTgXKst7agdK9sK1xDEwDUDawUu3dR3naP4wvV8Y3
	Vv142z4Z7NTgtM2Ms7v4aJsd/K1/wEcYeo5tEKy3B/w42pvu5GznH/CHfdsb1zm7U/FzYWV2iie
	fKGMaCSEXQNTYZrBg==
X-Received: by 2002:a17:90b:4ad1:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39b8bd997f7mr695966a91.8.1788786842561;
        Mon, 07 Sep 2026 06:14:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm20713756a91.1.2026.09.07.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:14:02 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH 2/2] tracing: hist: undo the registration when enabling the trigger fails
Date: Mon,  7 Sep 2026 22:13:57 +0900
Message-ID: <20260907131357.613555-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130105.94DD51F00A3D@smtp.kernel.org>
References: <20260907124420.607097-3-donggeunyoo.kernel@gmail.com> <20260907130105.94DD51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 01:01:05PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is a pre-existing issue, but missing cleanup in the error path before
> this label can lead to a use-after-free on the global named_triggers list.
>
> When hist_register_trigger() fails after successfully executing
> data->cmd_ops->init(data), it returns a negative error code without undoing
> the initialization. For instance, if tracing_set_clock() fails due to an
> invalid clock name:

Same one as on patch 1, answered there:

  https://lore.kernel.org/linux-trace-kernel/20260907125934.5C6261F00A3E@smtp.kernel.org/

It is fixed by a separate patch that moves tracing_set_clock() above the
init, which this series is not based on.
