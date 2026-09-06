Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82C2F6577
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788702672; cv=none; b=mH4tPksge1fAiX+LNvQU89LFAY2lxt0hxbkqpW3R8sJM5c/tO675g7mHENl8QhbFKAjcbosaQOmhKb8w0NL+Ct90AylkXJVzKvX0AcDLz63gx3MZ8QgMYQcQIsCtmBmDt+NrHy8jz1XJ9zO0Of8zVb4cextjpBgE/QOQsbDY34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788702672; c=relaxed/simple;
	bh=PzTfAdS+9fLuo1P9YI++Z3/Jco+RwdrcI6zo3wwgXPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnEZjRmILlB4OeEqufT6Es5lDHe7oQhV+Xb8l+dmIBnRs/rlqCIsbhNEBexHytf1yiVVU8aAh/4VpHY7OJ8c31DQXsMbbecTuInahFdWNZv4KsQdRNwVe7Gt8TfpKwdXpN6lVhziqq7S9jy+bOQ6yhBAIj4YV7MoI/dNKZ5dIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tm4F7V82; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm4F7V82"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-85377c8bc96so2373982b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788702670; x=1789307470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6UtiMUQWTUlQHIqJjKIo+v5d4gNNZT+BR9XA7w+Syc=;
        b=Tm4F7V82U9HTTYVvMt41L+evZ5vBdaVamzgDgb7+qV+cMwUQXUFAbU8thTC+t5Lsyg
         InnedVzjavWkwu8BXPBr5OSz35s4ZGXGwqinXiVno00jb5isSMU9Y8eHHNpHspT3Jtx2
         bF8WiYDgUDju0izghWMhcW+J5LqXq2i6cl7e+x+++S/PLAfSoLfJyx0JPEvEXkJnzsHd
         SdhESYrmqHGdDV09hej9iwAfidvSM4IE672pvgVkQHvqB8Qmc354f+MgsysyF4+RPyte
         SpeFTSbNqZURbmMXsjbYgaFIOJUMTCKBMtb4yU/lpp8UtvHdAvHhsKb+1TwT+Ekg2uJK
         LZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788702670; x=1789307470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6UtiMUQWTUlQHIqJjKIo+v5d4gNNZT+BR9XA7w+Syc=;
        b=XN1PzXaMvPiKwmF4WVcTIwGjm9hURDYmrNwKBC49Mb/YPIK9+s8Lft9ApA/BivFphI
         hxzkGB541p25LHLR7SeICvqTqHOvkT3xLaFYQzV5cc6IWxQSH7tjC4DWyXWilU5/IHU3
         hOU/iyDG67GjuZCj6u6Gx+k4R5ka4ImFAigFc7TTXvHlIr08SyyJRCNYiJUytEE9XWaF
         C3p7CKrrdNhk+vBhyAfGD+X2oARi9XptNH/POfXk7uHLJTplNR0hmgeTglCCe1vbpLjw
         J141TIsA4g8foBy71UTTzO9p0ABLNWNmWK7bhnhUBNIGGou4xMiHlARW3gRz8CWkq252
         Yy5Q==
X-Gm-Message-State: AFuF++nVXu41WEOpNU5xYEyUGWbHTBvAcCgyLRjAQlFjLZ9+8rEDjNeN
	fxK/84SGSxnWgdotmI7Zcq8JXas5vnpeU7DdZSfwtm2V0PWy54Am9+pOBAbzLwLK2A==
X-Gm-Gg: AYBFou1OtZeJY+4Ycxz5nPj13XZNetrj0UTP4nBwqDF9S4YI9vSsYZ5M1vO7JlRRbxX
	cjuQ6M0KIb1fLTfEW8Dmcr9cUCrJtEJVeAgleXWT1ebG5aNIvWKcg5RZb01mMShv4Pv1BwV++XZ
	f04N1dYgbxS6NEshbPNWiJFdlz9m/JSrg+Brk7eFDJsgqZSdpcvJBHd0VlbVL0rQfgVqc8EGwyq
	AabU73zaVCZjMlV9n4ZjJDFvNSH3rDrwJ9h/t2dV2SqRXPWiVUypiVmLgCWi3mMNph7VG+UnnDX
	C5bMMz3JeIvexdSrs+2KlyScGsOQ25ak7o5vw6gba4gQ4kbuFZxA/Z6wfZhib81tn5UMeA2Z1IS
	EelvNcSkrs891MyWcjAv/ABCgtARUhoazO7zq3cG0oh+BqVY6CDrxzpJ8jHveIdUdiJ7reYeuxF
	pUu+elSLsihCOTRc57GmbPNMv0lt3HUYKBejj+WoKHzAeFVbNXHvioFOQeQ5NhMHYDxk/zHcbeo
	c93doKOkpFRM6C/
X-Received: by 2002:a05:6a00:2309:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-861630c5ce5mr22606108b3a.0.1788702670118;
        Sun, 06 Sep 2026 06:51:10 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:2b14:fe4a:ab17:f236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86154048bddsm3271018b3a.60.2026.09.06.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:51:09 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: free the var ref when its initialization fails
Date: Sun,  6 Sep 2026 22:51:05 +0900
Message-ID: <20260906135105.4092962-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906134553.71E331F00A3A@smtp.kernel.org>
References: <20260906133352.3815019-1-donggeunyoo.kernel@gmail.com> <20260906134553.71E331F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko wrote:
> - [High] Pre-existing memory leak in `__destroy_hist_field()` for variable
> references (`VAR_REF` fields) reused three or more times within a histogram
> trigger.

That is the bug fixed by the patch linked in this one's notes:

  https://lore.kernel.org/linux-trace-kernel/20260906124025.3550596-1-donggeunyoo.kernel@gmail.com/

It removes the reference count so __destroy_hist_field() frees
unconditionally, and the three-reference case no longer leaks. The two
patches are independent and apply in either order.
