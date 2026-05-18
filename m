Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFD53803CB
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074687; cv=none; b=dR8TGCFw0a5jerD1h2qQkIfaeBbYFkYmpY63FM8dohLkSAyf5OWbLN3AVSByrVTPDvGhuaO2OA6CFV8rn4BejwAdl8rvWehL5houzE9Mv+ugdPdS4d6TOrIiQDHYJa0wR1CGDy5ZXq5ARo6Lf9pgiQBlryhy+xGqgv9ND0kRB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074687; c=relaxed/simple;
	bh=pTLlp5bzp9ouQFshixLL/vuTExg1XTsP7YGkmFuARog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siHuxr0atb942NXKXz200AMAQWuQbKa/rMEf/oqpCUdOLT81OVJ9Vv2+Bl1H7QdvrOQrpVK5w0bCp/LZ58RAQAeyQPzpnzmnaPyYvTpgo96YWvw6k328LHKo8pnScttUssxuKjVjRvqbxpdSK7pBkUVqn0J3qpHAvW7XNO+qZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDgnO764; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDgnO764"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c828daf83e2so712044a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 20:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779074685; x=1779679485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3928H8NXYePWZBZfOKMv4+zmyhzTHFKKV0PQCWA/vU=;
        b=CDgnO764mZN1ahtzKXMF+imNxXmZOTJa3tu/Wysz9X+EjKGeb0FfrIBBuBqKNHiVv4
         L+tXIzIH7R1B1jQOvbXOP3OfQqoKwwMxeprz0hx9OPoZ4XOeHtoir/ghDM/ItOwuEeh9
         w9NwtAzuiNu6g1gwZ5dTcoACgMk03NDYOa/v4515B18/bmgb+T7IBX/vLy1W7D/oM1oq
         tQG+2WICrWZ/EKXKXQXgQ/uR6XFG7bfvXslmukeurwAlRWqZ5+oY7hNNPCUJfHhNTVN+
         Gc5zUZ6TQ/aguQ+V+c3ecNmzlbmE21hXdBIGHTtBSsY/0Ht9ShE031I2bH4Ydk5ssTzb
         yTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779074685; x=1779679485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3928H8NXYePWZBZfOKMv4+zmyhzTHFKKV0PQCWA/vU=;
        b=cDsQCL08xcCA6Sc13GIAg96eVWuJT123VTBqZfuXs9icYYNX1MK+c8pU1GHi1Eev2Y
         WGoKDUoIIfTKzdQo5IIUfWh5vfXQxBTz1xcHy3uG7oodc5gn39tlNpTXv4V9Z1A/igql
         ZLKEWJHQzQktFlGXC5Fxhr3u+6ePDfZ4vWPTDKIw3jNNaRuGynVDm0Z3cR34GbZ73P11
         QAdxawv9VbNuO1Ypu496lm7nO6HP+eXcKZvglULwhgokmeN2m+RIvx3rffMqCzUGGQq6
         xVWv3mgMQMLet4uHpLwke0fzlIEFGE6jkexNrebdVrUxLIgzQjVXgSp7p1hqvVLiwPpd
         LyKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aWchHuhij9yePNbLHnkJCh9SCQjBXx2HVxJ48uOwKHlNXfD2IW+dzRb8j9+kSA4Qp9AUoiNmtXdWQA1b+PhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHlw0vxt2l7Lrkn/umHTKw1WmUY4R11C364gwExhEI6YUiQv0L
	i+XliovwZ/6OxNtpu6SJPaTFNfH19j8PRhCU4Mi919KZDUOJ+K2g/6vE
X-Gm-Gg: Acq92OHMzM538FxbrWt9+Qmf2DXXD7VBlvinPMeb66qhbN1FM4IW6QO7ddcbv9G5xgc
	2ZEDntotDtC8XiCSgXNGDOBvoXEMGN2iBAQRncyR+iJ/JwnkFrD9P8W0jf1+wqn7ZsnUz9KSOgi
	7HdNYJG/HjVQrOJp/HXGPN3n22S31Og2LHgAWkhg42xaGjROgGe4aLRzoRfFa6cWGkrE18F0Npe
	04aDe97qn5D8TB2sxv/t0P9sAMML9QmDj3d6hNpepeA7IprA55SCJl2roQxs4bEs898bjnfM2c3
	7HqvJ3jzdCHPBpfUcKcJTUd0meibGZ65T7aFsD/rGHtP/mQ0TKhdCDSz37rmeD6F1fBsbeK9UKA
	EQzcZxf/iAPemE7TDNxjvIKhsfcWUCGfPljpsLLeymMH/r1LqG0OJzMUi3iiuvwPdvlR/L7vSRH
	zGmP7LwB2udVQ/zTB3snIxrjP65CfKQVSgi8Lg9SSBrUF1i1cN8jiJ1P7lS43pTa8p+amSCmweQ
	qI=
X-Received: by 2002:a05:6a20:12ce:b0:39c:643e:f062 with SMTP id adf61e73a8af0-3b22e666e6bmr15766495637.7.1779074685504;
        Sun, 17 May 2026 20:24:45 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2600:5755:6da0:fa04:3566:e6d3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2fesm11721506a12.9.2026.05.17.20.24.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 17 May 2026 20:24:45 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: sashiko-bot@kernel.org
Cc: jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	live-patching@vger.kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	sashiko-reviews@lists.linux.dev,
	song@kernel.org
Subject: Re: [PATCH] livepatch: Allow to handle lifetime of shadow variables using the livepatch state
Date: Mon, 18 May 2026 11:24:36 +0800
Message-ID: <20260518032436.49958-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260514220757.412F4C2BCB3@smtp.kernel.org>
References: <20260514220757.412F4C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Will this callback run in an atomic context, unlike the other state callbacks?

> All existing state callbacks execute in standard process context and are
> permitted to sleep. However, looking at klp_shadow_free_all(), it invokes
> the destructor while holding klp_shadow_lock:

> kernel/livepatch/shadow.c:klp_shadow_free_all() {
> 	 ...
>	 spin_lock_irqsave(&klp_shadow_lock, flags);
>
>	 hash_for_each(klp_shadow_hash, i, shadow, node) {
>	 	if (klp_shadow_match(shadow, shadow->obj, id))
>	 		klp_shadow_free_struct(shadow, dtor);
>	 }
>
>	 spin_unlock_irqrestore(&klp_shadow_lock, flags);
> }

> If a user assumes this callback runs in process context like the other
> state callbacks and includes sleeping operations, couldn't this trigger
> a scheduling while atomic panic?

This problem wasn't introduced by this change; it already existed beforehand.
There shouldn't be any sleeping operations in klp_shadow_dtor_t. Maybe we
should rename it to klp_shadow_atomic_dtor_t.

[...]

> Does tying shadow variable lifetime to the global patch state cause leaks when
> dealing with loadable modules?

> If a livepatch applies to a loadable module, it may allocate shadow variables
> keyed to the module's dynamically allocated objects.

> When the target module is unloaded, klp_module_going() unpatches the module's
> objects. However, because the state is a global property of the patch, no
> state callbacks are invoked and the state is not considered obsolete. This
> leaves the shadow variables for the unloaded module orphaned in the global
> hash table.

> If the module is subsequently reloaded and allocates new objects at the same
> memory addresses, wouldn't klp_shadow_alloc() fail with a duplicate warning,
> or klp_shadow_get() incorrectly return stale data?

You're right, this is an issue. We need to ensure the associated shadow
variables are freed during klp_module_going().

[...]

> Can this permanently leak shadow variables and state during an atomic replace?

> Livepatch supports stacking, allowing multiple active patches (e.g., Patch A
> and Patch B) to define the same state. If an atomic replace patch (Patch C)
> is loaded, it replaces both A and B.

With the introduction of replace_set, it's no longer possible for different
patches to define the same state within the same set. So, I don't think this
is an issue.

