Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B33B3A543F
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495223; cv=none; b=dVkreiyP7SD4EYihcw3FJ/+ao9DS7YIfn/BC1T1xvg1q6KDkrzCXc0bQyDH2kjACzpCEbFqTrck03Wp6nr5hwQevNZEPVeq0DBuK4QJnGtqWAjlfL0TQ11FmTj3kXQ9JYQBOMFHI6qWiwA78AqTE8D+3biS7P6prVX9+l/86Sss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495223; c=relaxed/simple;
	bh=Q+1O3tRDfbn/86U7C5mg+qTtPjxf7jG1gT/xqt4SFEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eTYTimEO5nHxv5Y4tWOEcg070CNO7fz7jhCqjM8/mlS6j0Hr1oGhFZTBh51lGFc+IeeEaCLItBaIq7MC1KI+Jmz1yuqSVuxITZ9y4EVAo7d1aT6kzzUOXjjfUhxNi+GsKycLkkx6p3umru67PckQwa6RzVKCK99/jV74V6nqXac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtXuP0ov; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtXuP0ov"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-919abb3335fso15249766d6.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791495221; x=1792100021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5sZmbVXx25gBaCh/VEfL3wZ4pRH9BSl85pkkgIKJEo=;
        b=MtXuP0ovMahDmUEbBxKtZrcOE9rckRAPpqoBkXm24ldRrwWpg0ulp6FO4CTW9BSVbi
         OqD8nh5FzDnd72wRVi/nnWdAKOZYQVpLdlaXzttjY/wYGpWpUmAmR8JHQpJY6jQ7t7nh
         ioemyjU26uWfllsZbRudd0wEBlN+W8Xj/xryJlbou5nz8XBHbVAur120eCXzXjQAqGS5
         YlVYXCzurDf/nTSlgZG43nc47tm+5viQvRa29n2rIlcrZ3A2jg89QYvWZvPq56CxmeYq
         UwWHNJLiSiYCShcwsMwK42l/fzZSHJKCdL9uM3f/4H0fi0Rq5F5ocgvZbo2rqV+eo3W8
         Km2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495221; x=1792100021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5sZmbVXx25gBaCh/VEfL3wZ4pRH9BSl85pkkgIKJEo=;
        b=0zkDc+fT5x9G3BxStmq0Xj6LPmSJyIs13/gW7qLZ/OyjKTzKPL1GI/ZuR3koRahMEf
         lFvyM1LKG/+V1wSJESvvdM+aj76y1FFNcF08QKXRbswdF99376jSfrQAFEZ5rG/xx3bN
         txwYK0w5aw2K8Vi/RL0yPH12D7n0RTESomyzCIfB4qq8/2yhqUYIVxDWGoUKs+pjqB52
         T8AIbcpStVO+rF4uaDj3oa6S829+2v98EPqn/9EVbQly2hiMzzAx/TN6AxHCzOz4tILc
         PRUt9Mn1IZi3nHbcKN4akI1wJqC3V3V1n+Lpqxzr2TYlbGm+K+qcd9O5tAbUs2TAa80s
         R1Lw==
X-Forwarded-Encrypted: i=1; AKwUvByQXaAQeeBbKUabtREm+aCQ5KxdfAUiTMipW/o0pz7yrkWmy2+wMG1hST7krWJ8Udda02+nFqVwRvR4gJOfSRg=@lists.linux.dev
X-Gm-Message-State: AFuF++knyk2DThroIvlBvk46d7xzKdaJBT913ky5OWjO86dQUr/FDJMj
	wJUiUWr9XVgbW0MWbd29hTYnPnOibiSabpuomTxgLvb+y+dsakjdGkHs
X-Gm-Gg: AYBFou0oZsHFxb5AjbSCbpRqChNuJVkqCFfg3WYdwbUHvPI3pvoDrfcC4QC2dFvKOnh
	507aSc6YXJrUT8QJ4N6AkCGkcnIQuW0MGd3TLYzCfYyhvV1+2kGboCWck8I7EBdZ9Qbc3I0U16j
	yllKHeQgP/13e3P4PPin/bOC00Mcv4L6TknoieV6itTPqPsMLiCWY1dMFd88XlZM5kXdz1qkURP
	r4L7XWK8NYKkckGNdwnp3/mymkkZmUbmjFOLE5prERGXcRpNa4Jx1MguKoRdAVgzyLdFHHGrxcN
	L8L7iVloDsSSrVQiuS75m2iaG+0FCHVUel6sGKpWfavqeBbvuf5mTQK9+aRN3Td4FV7ZJrbttoJ
	iH/seoh06IPyW6MUJWoWHQLye4Nn5KDleTDLN3Tjxj0jSq3951CuDf2vHLnj11gwhIN+0hyhkYQ
	Z0CG42jXmjPmWCO+DKgtA9ZmUcJu/HYzv+K5I5oj1y4cbNwctln5rbOh+FLguNG1K0zEtVz2JK/
	umq7KxEiwJdhKksmEkxqklBuyYWBAsapToh8ifqOFQOutwzYn/lwtxcCr5vWmnUQ8jFSjHTrOqD
	xbC2DFB5adaIjCFR+wN52rZx8aMdEg7/oUVtxEp02wQAJ8OrZM2ZL9s8x7wHNxxuDmxnIYTv/2L
	8oHapogSKq40B+xW/a+k4H/Al898YIoMk4j0TWJ9JcRFgaOghytrvcc8sS+g6DmmUSAmS7fgel4
	JTwq/h8DeNWGan5cUBfRxDEmcIzt4p
X-Received: by 2002:a05:620a:808c:b0:93c:7e9c:3bba with SMTP id af79cd13be357-93eb9688d40mr83613085a.41.1791495221069;
        Thu, 08 Oct 2026 14:33:41 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98861bdsm29484885a.24.2026.10.08.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:33:40 -0700 (PDT)
From: mosafer <mohsafer@gmail.com>
X-Google-Original-From: mosafer <mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
To: sashiko-bot@kernel.org
Cc: linux-usb@vger.kernel.org,
	mohsafer@gmail.com,
	sashiko-reviews@lists.linux.dev,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] driver core: complete deferred binds when drivers_autoprobe is off
Date: Thu,  8 Oct 2026 16:33:20 -0500
Message-Id: <20261008213320.268141-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-164361@kernel.org>
References: <sashiko-outbox-164361@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Mosafer <mohsafer@gmail.com>

device_add() registers a device and then runs the bus's initial probe
via bus_probe_device() -> device_initial_probe().  With
drivers_autoprobe disabled for the bus, device_initial_probe() skipped
__device_attach() entirely.

That is correct for automatic *matching* against the bus's driver list,
but __device_attach() also doubles as "complete a bind that a driver
already initiated": when dev->driver has been pre-assigned outside the
normal match/probe path, it finishes the bind by calling
device_bind_driver() under the device lock, bypassing probe().

With autoprobe off, that second duty was skipped too.  USB depends on
it: usb_driver_claim_interface() pre-sets dev->driver on an interface
that is not yet registered, documenting "let the future device_add()
bind it, bypassing probe()".  Composite drivers (cdc-acm, cdc_ncm,
cdc_mbim, ...) rely on it to bind their sibling data interfaces.  If
drivers_autoprobe is written with 0 while such an interface is between
the claim and its device_add(), the interface ends up registered, with
dev->driver set and iface->condition == USB_INTERFACE_BOUND, but never
bound: its knode_driver is never attached to the driver's
klist_devices.

Teardown then trusts those flags: usb_driver_release_interface() ->
device_release_driver() -> __device_release_driver() runs a full
release and calls klist_remove(&dev->p->knode_driver) on a
never-attached node whose knode_klist() is NULL, which klist_put()
dereferences:

  Oops: general protection fault
  KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
  klist_put <- klist_remove <- device_release_driver_internal <-
  usb_driver_release_interface <- acm_disconnect / cdc_ncm_unbind

Keep device_initial_probe() always calling __device_attach(), but pass
whether automatic matching is allowed (sp->drivers_autoprobe) down to
it, and evaluate that flag inside __device_attach() under the device
lock, where dev->driver is read anyway:  a device with a pre-assigned
driver completes its bind regardless of autoprobe, and only a device
without one is subject to the matching policy.  Evaluating the two
conditions inside the locked branch (rather than as
"autoprobe || dev->driver" in the caller) also closes a TOCTOU: a
concurrent detach can no longer turn the completion of a pre-assigned
bind into bus-wide matching behind an "autoprobe off" policy.

Other subsystems that preset dev->driver before device_add() (w1,
tegra xusb, zynqmp-ipi-mailbox) get the same correctness back; for
devices with no pre-assigned driver and autoprobe off, behavior is
unchanged.

Reproduced with syzkaller's C reproducer on a 7.3.0-rc6 tree:
instrumentation shows the doomed interface's device_add() racing an
autoprobe=0 write; the bind-completion branch never runs for it; later
teardown hits klist_remove() with a pristine node.  With this patch the
same instrumented race completes the bind inside the window (3 VMs,
5 min per run: window hit 3 times, bind completed 3 times, and 802
devices with no pre-assigned driver correctly skipped matching despite
__device_attach() now always running): zero KLIST-REMOVE-BAD, zero
Oops.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: b8c5cec23d5c ("Driver core: udev triggered device-<>driver binding")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---

---

Thanks for the review. The TOCTOU is real: v1 evaluated
"sp->drivers_autoprobe || dev->driver" in device_initial_probe() without
device_lock held, so a concurrent detach in that window could make
__device_attach() observe dev->driver == NULL under the lock and fall
through to bus_for_each_drv() - a bus-wide match despite the
drivers_autoprobe=0 policy.

Changes since v1:
  - Move the decision into __device_attach(): it gains an allow_match
    argument (device_initial_probe() passes sp->drivers_autoprobe,
    device_attach() passes true) and evaluates it inside the locked
    if/else chain: a pre-assigned dev->driver completes its bind
    regardless of autoprobe; the bus_for_each_drv() matching branch only
    runs when matching is allowed or requested.  dev->driver is now read
    exactly once, under device_lock, so a concurrent detach can neither
    bypass the bind completion nor turn it into a spurious autoprobe.
  - The crash fix itself is untouched code: the else-if branch that
    completes the pre-assigned bind is identical to v1 / to the
    autoprobe-on path; only its reachability changed.

Re-verified with the same instrumented race (3 VMs, 5 min): window hit
3 times (DATT match=0 drv=1 bound=0), bind completed all 3 (DD-BIND,
teardown attached=1), and 802 devices with no pre-assigned driver under
match=0 returned without touching bus_for_each_drv(); zero
KLIST-REMOVE-BAD, zero Oops.

v1:     https://lore.kernel.org/all/20261008154105.256340-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us/
review: https://lore.kernel.org/all/sashiko-outbox-164361@kernel.org/

 drivers/base/dd.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..4c1bb1979519 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1065,7 +1065,8 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 	put_device(dev);
 }
 
-static int __device_attach(struct device *dev, bool allow_async)
+static int __device_attach(struct device *dev, bool allow_async,
+			   bool allow_match)
 {
 	int ret = 0;
 	bool async = false;
@@ -1085,6 +1086,17 @@ static int __device_attach(struct device *dev, bool allow_async)
 			device_set_driver(dev, NULL);
 			ret = 0;
 		}
+	} else if (!allow_match) {
+		/*
+		 * Automatic driver matching is suppressed for this device
+		 * (drivers_autoprobe is off), and no driver has been
+		 * assigned to it: do not run bus_for_each_drv() matching
+		 * for it.  Deciding this here, under device_lock, means a
+		 * concurrent driver detach between the caller picking
+		 * allow_match=false and reaching here cannot turn the
+		 * completion of a pre-assigned bind into bus-wide matching.
+		 */
+		goto out_unlock;
 	} else {
 		struct device_attach_data data = {
 			.dev = dev,
@@ -1138,7 +1150,7 @@ static int __device_attach(struct device *dev, bool allow_async)
  */
 int device_attach(struct device *dev)
 {
-	return __device_attach(dev, false);
+	return __device_attach(dev, false, true);
 }
 EXPORT_SYMBOL_GPL(device_attach);
 
@@ -1149,8 +1161,18 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	if (sp->drivers_autoprobe)
-		__device_attach(dev, true);
+	/*
+	 * Always run the attach, but tell it whether automatic matching is
+	 * allowed.  Completing a bind that a driver already initiated (e.g.
+	 * usb_driver_claim_interface() pre-setting dev->driver for an
+	 * unregistered interface, expecting device_add() to bind it) is not
+	 * automatic matching and must happen even with drivers_autoprobe
+	 * off; matching is evaluated in __device_attach() under the device
+	 * lock.  Skipping the call entirely used to leave such devices
+	 * registered-but-unbound, and teardown then oopsed klist_removing
+	 * the never-attached knode_driver.
+	 */
+	__device_attach(dev, true, sp->drivers_autoprobe);
 
 	subsys_put(sp);
 }
-- 
2.34.1

