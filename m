Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED72DB795;
	Mon, 20 Jul 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561176; cv=none; b=fT+TzJoJwGshWpJao/0gYP7IuScNcrfAbwQyWdCHKDKXvub5rG6+gG6nOXNYevI4n7loCmOa5N41iX4KeMwXhiqdmC9REVux+TS6/u9ic2MqaFGCUn3VVuQuikbxEOqO5gTMozhM0NGU302ILjPNNZomG0uK2cpjS3GWY7RvYxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561176; c=relaxed/simple;
	bh=HCktH2JZ+gpVmlhA1Wty4OFGQZBrVgbw92tlApWFuq4=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=eYT3IXi/JdY3AtNaX8fQ2ZMoTxnX4yhYoGrIxNlcayGh3n/zuMRg3EF+8IdNkgognt/ILW8+LmMHhrw1bC0ATnZf7XsdD3FxNWb3jjBJtoOJ7ajZYmPlMdWAauviikc+HT3+Qj9WH/NkRaNhejC13UiA0q1PhhuBMLUk2LTgfOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t01rrx90; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t01rrx90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9281F000E9;
	Mon, 20 Jul 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784561174;
	bh=utms7Ln/FfwScFPNgnGLuvFO+cuGaf20H9coQnKarcM=;
	h=Subject:To:Cc:From:Date;
	b=t01rrx90t/v7uW0jHFkgENqjGUrtxJhRicddabZegNxur2o3Ra2hmFy6AG2bsEg7X
	 rRztm4CBNHZiW6T8ucidmWLPmQ1Oo9PILEeirHq+s20QPl+qYMob9iIWlv5Ujybnk4
	 FDe7XF4gBVz3ohPYucApGdCXdPHoxCzN+raR0Ljg=
Subject: Patch "can: bcm: add missing rcu list annotations and operations" has been added to the 7.1-stable tree
To: gregkh@linuxfoundation.org,mkl@pengutronix.de,sashiko-reviews@lists.linux.dev,socketcan@hartkopp.net,stable@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Jul 2026 17:24:02 +0200
Message-ID: <2026072002-stratus-reaction-367a@gregkh>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    can: bcm: add missing rcu list annotations and operations

to the 7.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     can-bcm-add-missing-rcu-list-annotations-and-operations.patch
and it can be found in the queue-7.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 7b2c3eabc4dafc062a25e10711154f2107526a78 Mon Sep 17 00:00:00 2001
From: Oliver Hartkopp <socketcan@hartkopp.net>
Date: Tue, 14 Jul 2026 18:55:27 +0200
Subject: can: bcm: add missing rcu list annotations and operations

From: Oliver Hartkopp <socketcan@hartkopp.net>

commit 7b2c3eabc4dafc062a25e10711154f2107526a78 upstream.

sashiko-bot remarked the missing use of list_add_rcu() in
bcm_[rx|tx]_setup() to have a proper initialized bcm_op structure
when bcm_proc_show() traverses the bcm_op's under rcu_read_lock().

To cover all initial settings of the bcm_op's the list_add_rcu() calls
are moved to the end of the setup code.

While at it, also fix the mirroring removal side: bcm_release() called
bcm_remove_op() - which frees the op via call_rcu() - on ops that were
still linked in bo->tx_ops/bo->rx_ops, without list_del_rcu() first.
Unlink each op with list_del_rcu() before handing it to bcm_remove_op(),
matching the existing pattern in bcm_delete_tx_op()/bcm_delete_rx_op().

Reported-by: sashiko-reviews@lists.linux.dev
Closes: https://lore.kernel.org/linux-can/20260610094654.A1FFE1F00893@smtp.kernel.org/
Fixes: dac5e6249159 ("can: bcm: add missing rcu read protection for procfs content")
Signed-off-by: Oliver Hartkopp <socketcan@hartkopp.net>
Link: https://patch.msgid.link/20260714-bcm_fixes-v15-5-562f7e3e42da@hartkopp.net
Cc: stable@kernel.org
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/can/bcm.c |   25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

--- a/net/can/bcm.c
+++ b/net/can/bcm.c
@@ -262,7 +262,7 @@ static int bcm_proc_show(struct seq_file
 			   (reduction == 100) ? "near " : "", reduction);
 	}
 
-	list_for_each_entry(op, &bo->tx_ops, list) {
+	list_for_each_entry_rcu(op, &bo->tx_ops, list) {
 
 		seq_printf(m, "tx_op: %03X %s ", op->can_id,
 			   bcm_proc_getifname(net, ifname, op->ifindex));
@@ -994,6 +994,7 @@ static int bcm_tx_setup(struct bcm_msg_h
 	struct bcm_sock *bo = bcm_sk(sk);
 	struct bcm_op *op;
 	struct canfd_frame *cf;
+	bool add_op_to_list = false;
 	unsigned int i;
 	int err;
 
@@ -1135,8 +1136,7 @@ static int bcm_tx_setup(struct bcm_msg_h
 		hrtimer_setup(&op->thrtimer, hrtimer_dummy_timeout, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_SOFT);
 
-		/* add this bcm_op to the list of the tx_ops */
-		list_add(&op->list, &bo->tx_ops);
+		add_op_to_list = true;
 
 	} /* if ((op = bcm_find_op(&bo->tx_ops, msg_head->can_id, ifindex))) */
 
@@ -1158,6 +1158,10 @@ static int bcm_tx_setup(struct bcm_msg_h
 		op->flags |= TX_ANNOUNCE;
 	}
 
+	/* add this bcm_op to the list of the tx_ops? */
+	if (add_op_to_list)
+		list_add_rcu(&op->list, &bo->tx_ops);
+
 	if (op->flags & TX_ANNOUNCE)
 		bcm_can_tx(op, NULL);
 
@@ -1350,9 +1354,6 @@ static int bcm_rx_setup(struct bcm_msg_h
 		hrtimer_setup(&op->thrtimer, bcm_rx_thr_handler, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_SOFT);
 
-		/* add this bcm_op to the list of the rx_ops */
-		list_add(&op->list, &bo->rx_ops);
-
 		/* call can_rx_register() */
 		do_rx_register = 1;
 
@@ -1426,10 +1427,12 @@ static int bcm_rx_setup(struct bcm_msg_h
 					      bcm_rx_handler, op, "bcm", sk);
 		if (err) {
 			/* this bcm rx op is broken -> remove it */
-			list_del_rcu(&op->list);
 			bcm_remove_op(op);
 			return err;
 		}
+
+		/* add this bcm_op to the list of the rx_ops */
+		list_add_rcu(&op->list, &bo->rx_ops);
 	}
 
 	return msg_head->nframes * op->cfsiz + MHSIZ;
@@ -1763,8 +1766,10 @@ static int bcm_release(struct socket *so
 		remove_proc_entry(bo->procname, net->can.bcmproc_dir);
 #endif /* CONFIG_PROC_FS */
 
-	list_for_each_entry_safe(op, next, &bo->tx_ops, list)
+	list_for_each_entry_safe(op, next, &bo->tx_ops, list) {
+		list_del_rcu(&op->list);
 		bcm_remove_op(op);
+	}
 
 	list_for_each_entry_safe(op, next, &bo->rx_ops, list) {
 		/*
@@ -1795,8 +1800,10 @@ static int bcm_release(struct socket *so
 
 	synchronize_rcu();
 
-	list_for_each_entry_safe(op, next, &bo->rx_ops, list)
+	list_for_each_entry_safe(op, next, &bo->rx_ops, list) {
+		list_del_rcu(&op->list);
 		bcm_remove_op(op);
+	}
 
 	/* remove device reference */
 	if (bo->bound) {


Patches currently in stable-queue which might be from socketcan@hartkopp.net are

queue-7.1/can-bcm-track-a-single-source-interface-for-anydev-timeout-throttle-ops.patch
queue-7.1/can-bcm-validate-frame-length-in-bcm_rx_setup-for-rtr-replies.patch
queue-7.1/can-bcm-defer-rx_op-deallocation-to-workqueue-to-fix-thrtimer-uaf.patch
queue-7.1/can-isotp-serialize-tx-state-transitions-under-so-rx_lock.patch
queue-7.1/can-isotp-fix-use-after-free-race-with-concurrent-netdev_unregister.patch
queue-7.1/alsa-hda-fix-kconfig-dependency-of-hd-audio-pci.patch
queue-7.1/can-isotp-use-unconditional-synchronize_rcu-in-isotp_release.patch
queue-7.1/can-bcm-fix-lockless-bound-ifindex-race-and-silent-rx_setup-failure.patch
queue-7.1/can-bcm-extend-bcm_tx_lock-usage-for-data-and-timer-updates.patch
queue-7.1/can-bcm-add-missing-rcu-list-annotations-and-operations.patch
queue-7.1/can-bcm-add-missing-device-refcount-for-can-filter-removal.patch
queue-7.1/can-bcm-add-locking-when-updating-filter-and-timer-values.patch
queue-7.1/can-bcm-fix-can-frame-rx-tx-statistics.patch
queue-7.1/can-bcm-fix-data-race-on-rx_stamp-rx_ifindex-in-bcm_rx_handler.patch
queue-7.1/can-bcm-fix-stale-rx-tx-ops-after-device-removal.patch
